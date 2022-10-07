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
    private let profile = User.getPersonInfo()
    
    private let primaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 220/255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 30/255,
        green: 40/255,
        blue: 60/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
    //MARK: - IBActions
    @IBAction func loginButtonPressed() {
        if usernameTF.text != profile.login ||
            passwordTF.text != profile.password {
            showAlert(title: "Invalid login or password",
                      and: "Please, enter correct name and password")
        }
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", and: "Your name is \(profile.login)")
        : showAlert(title: "Oops!", and: "Your password is \(profile.password)")
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
        
        for viewController in tabBarController.children {
            if let navigationVC =
                viewController as? UINavigationController {
                
                if let welcomeVC = navigationVC.topViewController as? ProfileViewController {
                    welcomeVC.profile = profile
                }
                else if let pictureVC =
                            navigationVC.topViewController as? PictureViewController {
                    pictureVC.profile = profile
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
