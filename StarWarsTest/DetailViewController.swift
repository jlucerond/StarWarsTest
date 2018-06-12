//
//  DetailViewController.swift
//  StarWarsTest
//
//  Created by Joe Lucero on 6/12/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
   var character: StarWarsCharacter? {
      didSet {
         loadViewIfNeeded()
         updateDetailViewController()
      }
   }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
   func updateDetailViewController() {
      
   }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
