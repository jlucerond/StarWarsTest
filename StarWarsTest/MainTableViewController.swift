//
//  MainTableViewController.swift
//  StarWarsTest
//
//  Created by Joe Lucero on 6/12/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
   
   override func viewDidLoad() {
      super.viewDidLoad()
      NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: StarWarsCharacterController.charactersWereUpdated, object: nil)
   }
   
   @objc private func reloadTableView() {
      DispatchQueue.main.async {
         self.tableView.reloadData()
      }
   }
   
   // MARK: - Table view data source
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return StarWarsCharacterController.shared.characters.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "StarWarsCharacter", for: indexPath)
      
      let character = StarWarsCharacterController.shared.characters[indexPath.row]
      
      cell.textLabel?.text = character.firstName
      
      return cell
   }
   
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "ToDetailVC" {
         guard let indexPath = tableView.indexPathForSelectedRow else {
            return
         }
         
         let selectedCharacter = StarWarsCharacterController.shared.characters[indexPath.row]
         
      }
    }
   
}
