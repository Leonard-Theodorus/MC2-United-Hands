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
    
    func saveExpenseData(imageData: Data, category: String, amount: Int, timestamp: Date) -> Expense? {
        let context = persistentContainer.newBackgroundContext()
        let newExpense = Expense(context: context)
        
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
    
    func retrieveExpenseData(expenseEntity: Expense) -> expenseData? {
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
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        
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
    
//    func editExpense(){
//
//    }
    
    
}




