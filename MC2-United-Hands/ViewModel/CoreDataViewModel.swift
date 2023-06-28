//
//  ExpenseViewModel.swift
//  DataExpense
//
//  Created by Jason Leonardo on 25/06/23.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    private let viewContext = PersistenceController.shared.viewContext
    @Published var expenseArray: [ExpenseEntity] = []
    @Published var userExpenses: [ExpenseData] = []
    @Published var expenseToBeEdited : ExpenseData?
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
    func addExpenseNoArray(image: Data, amount: Int, category: String, timestamp: Date, startDate : Date, endDate : Date) {
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
            getExpensesByDateNoArray()
        } catch {
            print("Failed to save expense: \(error.localizedDescription)")
            
        }
    }
    func editExpenseNoArray(withUUID uuid: UUID, newCategory: String, newAmount: Int, newDate : Date, startDate : Date, endDate : Date) {
        let request = NSFetchRequest<ExpenseEntity>(entityName: "ExpenseEntity")
        request.predicate = NSPredicate(format: "id == %@", uuid as CVarArg)
        do {
            let result = try viewContext.fetch(request) as [NSManagedObject]
            let date = newDate as NSDate
            result.first?.setValue(newCategory, forKey: "category")
            result.first?.setValue(newAmount, forKey: "amount")
            result.first?.setValue(date, forKey: "timestamp")
            save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func deleteExpense(withUUID uuid: UUID) {
        let request = NSFetchRequest<ExpenseEntity>(entityName: "ExpenseEntity")
        request.predicate = NSPredicate(format: "id == %@", uuid as CVarArg)
        do {
            let result = try viewContext.fetch(request) as [NSManagedObject]
            viewContext.delete(result.first!)
            save()
        } catch let error {
            print(error.localizedDescription)
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
    func getExpensesByDateNoArray() {
        var endOfWeek : Date
        var timeInterval = TimeInterval()
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 2
        var startOfWeek = Date()
        calendar.dateInterval(of: .weekOfMonth, start: &startOfWeek, interval: &timeInterval, for: Date())
        endOfWeek = startOfWeek.addingTimeInterval(timeInterval - 1)
        
        
        let request = NSFetchRequest<ExpenseEntity>(entityName: "ExpenseEntity")
        request.predicate = NSPredicate(format: "(timestamp >= %@) AND (timestamp <= %@)", startOfWeek as NSDate , endOfWeek as NSDate)
        
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
            userExpenses = expenseDataArray
        } catch {
            print("Failed to fetch expenses by date: \(error.localizedDescription)")
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
