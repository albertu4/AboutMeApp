//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Михаил Иванов on 24.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabelText: UILabel!
    
    var firstProfile: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabelText.text =
        "Welcome, \(firstProfile.person.name) \(firstProfile.person.surname)!"
    }
    
}
