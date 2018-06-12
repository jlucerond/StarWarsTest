//
//  StarWarsCharacterExtension.swift
//  StarWarsTest
//
//  Created by Joe Lucero on 6/12/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import Foundation

extension StarWarsCharacter {
   
   convenience init?(dictionary: [String : Any]) {
      self.init(context: CoreDataStack.context)
      
      guard let identifier = dictionary["id"] as? Int64,
      let firstName = dictionary["firstName"] as? String,
      let lastName = dictionary["lastName"] as? String,
      let birthDate = dictionary["birthdate"] as? String,
      let pictureURLAsString = dictionary["profilePicture"] as? String,
      let isForceSensitive = dictionary["forceSensitive"] as? Bool,
         let affiliation = dictionary["affiliation"] as? String else { return nil }
      
      self.identifier = identifier
      self.firstName = firstName
      self.lastName = lastName
      self.birthDate = birthDate
      self.pictureURLAsString = pictureURLAsString
      self.isForceSensitive = isForceSensitive
      self.affiliation = affiliation
   }
}
