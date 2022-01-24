//
//  PictureViewController.swift
//  AboutMeApp
//
//  Created by Михаил Иванов on 24.01.2022.
//

import UIKit

class PictureViewController: UIViewController {
    
    @IBOutlet var firstPicture: UIImageView!
    @IBOutlet var secondPicture: UIImageView!
    @IBOutlet var thirdPicture: UIImageView!
    
    var firstProfile: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(firstProfile.person.name) \(firstProfile.person.surname)"
        
        firstPicture.image = firstProfile.person.pictures[0]
        secondPicture.image = firstProfile.person.pictures[1]
        thirdPicture.image = firstProfile.person.pictures[2]
    }
}
