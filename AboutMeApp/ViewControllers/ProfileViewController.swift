//
//  ProfileViewController.swift
//  AboutMeApp
//
//  Created by Михаил Иванов on 24.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
   
    @IBOutlet weak var pictureOfPage: UIImageView!
    @IBOutlet weak var photoOfUser: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userStatus: UILabel!
    
    @IBOutlet weak var userBirthday: UILabel!
    @IBOutlet weak var userRelationship: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userEducation: UILabel!
    @IBOutlet weak var userJob: UILabel!
    
    var profile: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Account"
        
        setPicturesFrame()
        loadAccountInfo()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        photoOfUser.layer.cornerRadius = photoOfUser.bounds.height / 2
    }
    
    @IBAction func editStatusOfUser(_ sender: Any) {
        showAlertWithTF(title: "Change status", and: "What do you feel?")
    }
    
    private func setPicturesFrame() {
        pictureOfPage.layer.cornerRadius = 10
        photoOfUser.layer.borderWidth = 3
        photoOfUser.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func loadAccountInfo() {
        pictureOfPage.image = UIImage(named: profile.person.picture)
        photoOfUser.image = UIImage(named: profile.person.photo)
        
        userName.text = "\(profile.person.name) \(profile.person.surname)"
        userStatus.text = profile.person.userStatus
        userBirthday.text = profile.person.dateOfBirth
        userRelationship.text = profile.person.relationShip
        userLocation.text = profile.person.currentLocation
        userEducation.text = profile.person.education
        userJob.text = profile.person.job
    }
}

extension ProfileViewController {
    private func showAlertWithTF(title: String, and message: String) {
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
