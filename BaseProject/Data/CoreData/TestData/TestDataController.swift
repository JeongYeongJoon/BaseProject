//
//  TestDataController.swift
//  BaseProject
//
//  Created by 정영준 on 2023/07/26.
//

import Foundation
import CoreData

class TestDataController {
    static let shared = TestDataController()
    let container: NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "Data")
        container.loadPersistentStores { storeDescription, error in
            if let error {
                print("Could not load Core Data persistence stores.")
            }
        }
    }
    func saveChanges() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Could not save changes to Core Data.")
            }
        }
    }
    
    func CreateTestData(title: String, body: String, userId: Int64) {
        let entity = TestData(context: container.viewContext)
        
        entity.id = UUID()
        entity.title = title
        entity.body = body
        entity.userId = userId

        saveChanges()
    }
    
    func ReadTestData() -> [TestData]{
        var results: [TestData] = []
        
        let request = NSFetchRequest<TestData>(entityName: "TestData")
        
        do {
            results = try container.viewContext.fetch(request)
        } catch {
            print("Could not fetch changes to Core Data.")
        }
        return results
    }
    
    func UpdateTestData(entity: TestData, title: String? = nil, body: String? = nil, userId: Int64? = nil) {
        var hasChanges: Bool = false
        
        if title != nil {
            entity.title = title!
            hasChanges = true
        }
        
        if body != nil {
            entity.body = body!
            hasChanges = true
        }
        
        if userId != nil {
            entity.userId = userId!
            hasChanges = true
        }
        
        if hasChanges {
            saveChanges()
        }
    }
    
    func DeleteTestData(_ entity: TestData) {
        container.viewContext.delete(entity)
        saveChanges()
    }
}
