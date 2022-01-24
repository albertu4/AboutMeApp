//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Михаил Иванов on 24.01.2022.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    //MARK: - Private properties
    private let firstProfile = User.getPersonInfo()
    
    //MARK: - IBActions
    @IBAction func loginButtonPressed() {
        if usernameTF.text != firstProfile.login ||
            passwordTF.text != firstProfile.password {
            showAlert(title: "Invalid login or password",
                      and: "Please, enter correct name and password")
        }
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", and: "Your name is \(firstProfile.login)")
        : showAlert(title: "Oops!", and: "Your password is \(firstProfile.password)")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        usernameTF.text?.removeAll()
        passwordTF.text?.removeAll()
    }

}

//MARK: - Navigation
extension LoginViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        
        for viewController in tabBarController.viewControllers! {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.firstProfile = firstProfile
            } else if let navigationVC =
                        viewController as? UINavigationController {
                
                if let aboutMeVC =
                    navigationVC.topViewController as? AboutMeViewController {
                    aboutMeVC.firstProfile = firstProfile
                } else if let pictureVC =
                            navigationVC.topViewController as? PictureViewController {
                    pictureVC.firstProfile = firstProfile
                }
                
            }
        }
    }
}

// MARK: - Private Methods
extension LoginViewController {
    private func showAlert(title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTF.text?.removeAll()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed()
            performSegue(withIdentifier: "GoWelcomeVC", sender: nil)
        }
        return true
    }
    
}
