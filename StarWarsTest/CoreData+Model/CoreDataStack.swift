//
//  CoreDataStack.swift
//  StarWarsTest
//
//  Created by Joe Lucero on 6/12/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
   
   static let container: NSPersistentContainer = {
      
      let container = NSPersistentContainer(name: "StarWarsTestModel")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
         if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
         }
      })
      return container
   }()
   
   static var context: NSManagedObjectContext {
      return container.viewContext
   }
   
   static func saveContext() {
      if context.hasChanges {
         
         do {
            try context.save()
         } catch {
            print("Error trying to save changes to Core Data: \(error.localizedDescription)")
            return
         }
      }
   }
}
