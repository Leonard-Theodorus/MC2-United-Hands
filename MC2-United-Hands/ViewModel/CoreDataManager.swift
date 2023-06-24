//
//  DataController.swift
//  ExpenseData
//
//  Created by Jason Leonardo on 21/06/23.
//

import Foundation
import SwiftUI
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Core Data failed to load: \(error)")
            }
        }
        return container
    }()
    
    func saveExpenseData(imageData: Data, category: String, amount: Int, timestamp: Date) -> ExpenseEntity? {
        let context = persistentContainer.newBackgroundContext()
        let newExpense = ExpenseEntity(context: context)
        
        let imageFileName = "\(UUID().uuidString).jpg"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let imagePath = documentsDirectory.appendingPathComponent(imageFileName)
        
        do {
            try imageData.write(to: imagePath)
            newExpense.imageFilePath = imageFileName
            newExpense.category = category
            newExpense.amount = Int64(amount)
            newExpense.timestamp = timestamp
            
            try context.save()
            return newExpense
        } catch {
            print("Failed to save expense: \(error.localizedDescription)")
            return nil
        }
    }
    
    func retrieveExpenseData(expenseEntity: ExpenseEntity) -> expenseData? {
        guard let imageFileName = expenseEntity.imageFilePath else {
            return expenseData(image: nil, category: nil, amount: nil, timestamp: nil)
            }
            
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let imagePath = documentsDirectory.appendingPathComponent(imageFileName)
            
            //let id = expenseEntity.id
            let image = UIImage(contentsOfFile: imagePath.path)
            let category = expenseEntity.category
            let amount = Int(expenseEntity.amount)
            let timestamp = expenseEntity.timestamp
            
        return expenseData(image: image, category: category, amount: amount, timestamp: timestamp)
    }
    
    
    func fetchExpenses() -> [expenseData] {
        let context = CoreDataManager.shared.persistentContainer.newBackgroundContext()
        let fetchRequest: NSFetchRequest<ExpenseEntity> = ExpenseEntity.fetchRequest()
        
        do {
            let expenseEntities = try context.fetch(fetchRequest)
            return expenseEntities.compactMap { expenseEntity in
                CoreDataManager.shared.retrieveExpenseData(expenseEntity: expenseEntity)
            }
        } catch {
            print("Failed to fetch expenses: \(error.localizedDescription)")
            return []
        }
    }
    
    func editExpense(expense: ExpenseEntity, imageData: Data?, category: String, amount: Int, timestamp: Date) -> ExpenseEntity? {
        let context = persistentContainer.newBackgroundContext()
        
        do {
            // Update valuenya
            expense.category = category
            expense.amount = Int64(amount)
            expense.timestamp = timestamp
            
            // Cek dulu imagenya ada atau kagak
            if let imageData = imageData {
                if let imageFilePath = expense.imageFilePath {
                    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                    let imagePath = documentsDirectory.appendingPathComponent(imageFilePath)
                    
                    try FileManager.default.removeItem(at: imagePath)
                }
                
                let imageFileName = "\(UUID().uuidString).jpg"
                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let imagePath = documentsDirectory.appendingPathComponent(imageFileName)
                
                try imageData.write(to: imagePath)
                expense.imageFilePath = imageFileName
            }
            
            try context.save()
            
            return expense
        } catch {
            print("Failed to edit expense: \(error.localizedDescription)")
            return nil
        }
    }
    
    func deleteExpense(expense: ExpenseEntity) {
        let context = persistentContainer.newBackgroundContext()
        
        // Cek image terus deleteeee
        if let imageFilePath = expense.imageFilePath {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let imagePath = documentsDirectory.appendingPathComponent(imageFilePath)
            
            do {
                try FileManager.default.removeItem(at: imagePath)
            } catch {
                print("Failed to delete image file: \(error.localizedDescription)")
            }
        }
        context.delete(expense)
        
        do {
            try context.save()
        } catch {
            print("Failed to delete expense: \(error.localizedDescription)")
        }
    }
    
}
