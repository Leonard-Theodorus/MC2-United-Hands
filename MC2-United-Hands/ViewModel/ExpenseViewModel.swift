//
//  ExpenseViewModel.swift
//  DataExpense
//
//  Created by Jason Leonardo on 25/06/23.
//

import Foundation
import CoreData

class ExpenseViewModel: ObservableObject {
    private let viewContext = PersistenceController.shared.viewContext
    @Published var expenseArray: [ExpenseEntity] = []

    
    init() {
        fetchExpenseData()
    }
    
    func fetchExpenseData() {
        let request = NSFetchRequest<ExpenseEntity>(entityName: "ExpenseEntity")
        
        do {
            expenseArray = try viewContext.fetch(request)
        }catch {
            print("Fetch data failed")
        }
    }
    
    func addExpense(image: Data, amount: Int, category: String, timestamp: Date) {
        let expense = ExpenseEntity(context: viewContext)
        
        let imageFileName = "\(UUID().uuidString).jpg"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let imagePath = documentsDirectory.appendingPathComponent(imageFileName)
        
        
        
        do {
            try image.write(to: imagePath)
            expense.imageFilePath = imageFileName
            expense.id = UUID()
            expense.amount = Int64(amount)
            expense.category = category
            expense.timestamp = timestamp
            

            save()
            self.fetchExpenseData()
        } catch {
            print("Failed to save expense: \(error.localizedDescription)")
            
        }
        

    }
    
    func editExpense(withUUID uuid: UUID, category: String, amount: Int, image: Data) {
        if let expense = expenseArray.first(where: { $0.id == uuid }) {
            expense.category = category
            expense.amount = Int64(amount)
            
            if let imagePath = expense.imageFilePath {
                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let imageURL = documentsDirectory.appendingPathComponent(imagePath)
                
                do {
                    try FileManager.default.removeItem(at: imageURL)
                } catch {
                    print("Failed to delete old image file: \(error.localizedDescription)")
                }
            }
            
            let newImageFileName = "\(UUID().uuidString).jpg"
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let newImagePath = documentsDirectory.appendingPathComponent(newImageFileName)
            
            do {
                try image.write(to: newImagePath)
                expense.imageFilePath = newImageFileName
            } catch {
                print("Failed to save new image: \(error.localizedDescription)")
            }
            
            save()
            fetchExpenseData()
        }
    }
    
    func deleteExpense(withUUID uuid: UUID) {
        print(uuid)
        if let expense = expenseArray.first(where: { $0.id == uuid }) {
            if let imagePath = expense.imageFilePath {
                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let imageURL = documentsDirectory.appendingPathComponent(imagePath)
                
                do {
                    try FileManager.default.removeItem(at: imageURL)
                } catch {
                    print("Failed to delete image file: \(error.localizedDescription)")
                }
            }
            
            viewContext.delete(expense)
            save()
            fetchExpenseData()
        }
    }
    
    // Filters
    
    func getExpensesByDate(startDate: Date, endDate: Date) -> [ExpenseData] {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: startDate)
        let endOfDay = calendar.startOfDay(for: endDate).addingTimeInterval(24 * 60 * 60)
        
        let request = NSFetchRequest<ExpenseEntity>(entityName: "ExpenseEntity")
        request.predicate = NSPredicate(format: "(timestamp >= %@) AND (timestamp < %@)", startOfDay as NSDate, endOfDay as NSDate)
        
        do {
            let fetchedExpenses = try viewContext.fetch(request)
            let expenseDataArray = fetchedExpenses.map { expenseEntity in
                ExpenseData(
                    id: expenseEntity.id ?? UUID(),
                    image: loadImageFromPath(expenseEntity.imageFilePath!),
                    category: expenseEntity.category,
                    amount: Int(expenseEntity.amount),
                    timestamp: expenseEntity.timestamp
                )
            }
            return expenseDataArray
        } catch {
            print("Failed to fetch expenses by date: \(error.localizedDescription)")
            return []
        }
    }
    
    func getExpensesByCategory(category: String) -> [ExpenseData] {
        let request = NSFetchRequest<ExpenseEntity>(entityName: "ExpenseEntity")
        request.predicate = NSPredicate(format: "category == %@", category)
        
        do {
            let fetchedExpenses = try viewContext.fetch(request)
            let expenseDataArray = fetchedExpenses.map { expenseEntity in
                ExpenseData(
                    id: expenseEntity.id ?? UUID(),
                    image: loadImageFromPath(expenseEntity.imageFilePath!),
                    category: expenseEntity.category,
                    amount: Int(expenseEntity.amount),
                    timestamp: expenseEntity.timestamp
                )
            }
            return expenseDataArray
        } catch {
            print("Failed to fetch expenses by category: \(error.localizedDescription)")
            return []
        }
    }
    func save() {
        do {
            try viewContext.save()
        }catch {
            print("Error saving")
        }
    }
}
