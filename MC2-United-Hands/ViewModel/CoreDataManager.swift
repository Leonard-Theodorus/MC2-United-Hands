//
//  DataController.swift
//  ExpenseData
//
//  Created by Jason Leonardo on 21/06/23.
//

import Foundation
import SwiftUI
import CoreData
//sss

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
    
    func fetchExpenseById(by id: UUID) -> ExpenseEntity? {
        let context = CoreDataManager.shared.persistentContainer.newBackgroundContext()
        let fetchRequest: NSFetchRequest<ExpenseEntity> = ExpenseEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        fetchRequest.fetchLimit = 1
        
        do {
            let expenses = try context.fetch(fetchRequest)
            print(expenses.first as Any)
            return expenses.first
        } catch {
            print("Failed to fetch expense: \(error.localizedDescription)")
            return nil
        }
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
        let context = expense.managedObjectContext
        
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
            //save
            try context!.save()
            
            return expense
        } catch {
            print("Failed to edit expense: \(error.localizedDescription)")
            return nil
        }
    }
    
    func deleteExpense(expense: ExpenseEntity) {
        let context = expense.managedObjectContext
        
        if let imageFilePath = expense.imageFilePath {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let imagePath = documentsDirectory.appendingPathComponent(imageFilePath)

            do {
                if FileManager.default.fileExists(atPath: imagePath.path) {
                    try FileManager.default.removeItem(at: imagePath)
                } else {
                    print("Image file does not exist at path: \(imagePath.path)")
                }
            } catch {
                print("Failed to delete image file: \(error.localizedDescription)")
            }
        }
        
        context!.delete(expense)
        
        do {
            try context!.save()
        } catch {
            print("Failed to delete expense: \(error.localizedDescription)")
        }
    }


    
}
