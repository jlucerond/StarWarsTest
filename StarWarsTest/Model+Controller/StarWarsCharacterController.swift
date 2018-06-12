//
//  StarWarsCharacterController.swift
//  StarWarsTest
//
//  Created by Joe Lucero on 6/12/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import Foundation

class StarWarsCharacterController {
   
   static let charactersWereUpdated = Notification.Name("Updated")
   
   static let shared = StarWarsCharacterController()
   private(set) var characters: [StarWarsCharacter] = [] {
      didSet {
         print("updated the characters")
         print(characters.count)
         NotificationCenter.default.post(name: StarWarsCharacterController.charactersWereUpdated, object: nil)
      }
   }
   
   private init() {
      do {
         let characterCount = try CoreDataStack.context.count(for: StarWarsCharacter.fetchRequest())
         
         if characterCount == 0 {
            fetchCharactersFromWeb()
         } else {
            characters = try CoreDataStack.context.fetch(StarWarsCharacter.fetchRequest())
         }
         
      } catch {
         print("Error creating fetch request")
         fatalError()
      }
   }
   
   private func fetchCharactersFromWeb() {
      let baseURL = URL(string: "https://starwarstest16.herokuapp.com/api/characters")!
      
      URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
         if let error = error {
            print("Error getting data from URL: \(error.localizedDescription)")
         }
         
         guard let data = data else {
            return
         }
         
         do {
            guard let topLevelJSON = (try JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any],
               let individualsArray = topLevelJSON["individuals"] as? [[String:Any]] else {
                  print("Error converting data into a dictionary")
                  return
            }
            
            self.characters = individualsArray.compactMap{StarWarsCharacter(dictionary: $0)}
            
         } catch {
            print("Could not convert data from web into SW characters: \(error.localizedDescription)")
         }
         
         }.resume()
   }
   
}
