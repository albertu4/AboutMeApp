//
//  AboutMeViewController.swift
//  AboutMeApp
//
//  Created by Михаил Иванов on 24.01.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet var dateOfBirthUser: UILabel!
    @IBOutlet var locationOfUser: UILabel!
    @IBOutlet var educationOfUser: UILabel!
    @IBOutlet var jobOfUser: UILabel!
    @IBOutlet var hobbiesOfUser: UILabel!
    
    var firstProfile: User!
    private var numberOfHobby = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(firstProfile.person.name) \(firstProfile.person.surname)"
        
        dateOfBirthUser.text = firstProfile.person.dateOfBirth
        locationOfUser.text = firstProfile.person.currentLocation
        educationOfUser.text = firstProfile.person.education
        jobOfUser.text = firstProfile.person.job
        
        for hobby in firstProfile.person.hobbies {
            numberOfHobby += 1
            hobbiesOfUser.text?.append("\(numberOfHobby) - \(hobby)\n")
        }
    }
    
}
