//
//  DetailViewController.swift
//  StarWarsTest
//
//  Created by Joe Lucero on 6/12/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
   @IBOutlet weak var characterImageView: UIImageView!
   @IBOutlet weak var characterNameLabel: UILabel!
   @IBOutlet weak var characterAfilliationLabel: UILabel!
   @IBOutlet weak var characterAgeLabel: UILabel!
   
   var character: StarWarsCharacter? {
      didSet {
         loadViewIfNeeded()
         updateDetailViewController()
      }
   }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      
      if character!.isForceSensitive {
         animateImage()
      }
   }
   
   func updateDetailViewController() {
      guard let character = character else { return }
      
      if let imageAsData = character.pictureImage {
         characterImageView.layer.cornerRadius = characterImageView.frame.width/2
         characterImageView.layer.masksToBounds = true
         characterImageView.image = UIImage(data: imageAsData)
      }
      
      characterNameLabel.text = character.fullName
      characterAfilliationLabel.text = character.affiliation
      characterAgeLabel.text = "\(character.age ?? 0) years old"
      
      let colorForAffiliation: UIColor
      
      if character.affiliation == "JEDI" {
         colorForAffiliation = UIColor.green.withAlphaComponent(0.2)
      } else if character.affiliation == "RESISTANCE" {
         colorForAffiliation = UIColor.lightGray.withAlphaComponent(0.2)
      } else if character.affiliation == "FIRST_ORDER" {
         colorForAffiliation = UIColor.red.withAlphaComponent(0.2)
      } else if character.affiliation == "SITH" {
         colorForAffiliation = UIColor.black.withAlphaComponent(0.5)
      } else {
         colorForAffiliation = UIColor.clear
      }
      
      let subView = UIView(frame: self.view.frame)
      subView.backgroundColor = colorForAffiliation
      
      view.addSubview(subView)
      view.sendSubview(toBack: subView)
   }

   func animateImage() {
      
      UIView.animate(withDuration: 2.0,
                     delay: 0,
                     options: [.repeat, .autoreverse],
                     animations: {
                        self.characterImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
      },
                     completion: nil)
   
   }
}
