//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Михаил Иванов on 24.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
   
    @IBOutlet weak var pictureOfPage: UIImageView!
    @IBOutlet weak var photoOfUser: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userStatus: UILabel!
    
    @IBOutlet weak var userBirthday: UILabel!
    @IBOutlet weak var userRelationship: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userEducation: UILabel!
    @IBOutlet weak var userJob: UILabel!
    
    var firstProfile: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(firstProfile.person.name) \(firstProfile.person.surname)"
        pictureOfPage.layer.cornerRadius = 10
        photoOfUser.layer.borderWidth = 3
        photoOfUser.layer.borderColor = UIColor.lightGray.cgColor
        
        pictureOfPage.image = UIImage(named: firstProfile.person.picture)
        photoOfUser.image = UIImage(named: firstProfile.person.photo)
        
        userName.text = "\(firstProfile.person.name) \(firstProfile.person.surname)"
        userStatus.text = firstProfile.person.userStatus
        userBirthday.text = firstProfile.person.dateOfBirth
        userRelationship.text = firstProfile.person.relationShip
        userLocation.text = firstProfile.person.currentLocation
        userEducation.text = firstProfile.person.education
        userJob.text = firstProfile.person.job
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        photoOfUser.layer.cornerRadius = photoOfUser.bounds.height / 2
    }
    
    @IBAction func editStatusOfUser(_ sender: Any) {
        showAlert(title: "Change status", and: "What do you feel?")
    }
    @IBAction func exitFromProfile(_ sender: Any) {
        
    }
}

extension WelcomeViewController {
    private func showAlert(title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addTextField()
        alert.textFields?.first?.placeholder = "Wise men quotes..."
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userStatus.text = alert.textFields?.first?.text
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
