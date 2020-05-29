//
//  ViewController.swift
//  Login screen
//
//  Created by Nikita on 5/29/20.
//  Copyright © 2020 Nikita Begletskiy. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tabBar" {
            let tabBarVC = segue.destination as! TabBarViewController
            let welcomeVC = tabBarVC.viewControllers?.first as! WelcomeViewController
            welcomeVC.greeting = User.getUser().login
        }
    }
    
    @IBAction func unwindSegueToLogInStoryboard(segue: UIStoryboardSegue) {
        guard let _ = segue.source as? WelcomeViewController else { return }
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    
    //let user = User(login: "User", password: "Password", information: "123")

    // MARK: Actions
    @IBAction func logIn(_ sender: UIButton) {
        
        verify(userName: userNameTextField.text,
               with: User.getUser().login,
               and: passwordTextField.text,
               with: User.getUser().password)
        
    }
    
    @IBAction func helpWithUserName(_ sender: UIButton) {
        let alert = UIAlertController(title: "Did you forgot login?",
                                      message: "Your login is \"User\"",
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Okay",
                                        style: .default,
                                        handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true)
        
    }
    
    @IBAction func helpWithPassword(_ sender: UIButton) {
        let alert = UIAlertController(title: "Did you lost password?",
                                      message: "Your password is \"Pasword\"",
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Okay",
                                        style: .default,
                                        handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true)
        
    }
    

        
}


// MARK: textFields
extension LogInViewController: UITextFieldDelegate {
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField.tag == 1 {
            textField.resignFirstResponder()
            print("password text field was used")
            logInButton.sendActions(for: .allEvents)
        }
        return true
    }
    
}

// MARK: checkLoginAndPassword
extension LogInViewController {
    
    private func verify(userName: String?,
                        with trueUserName: String,
                        and password: String?,
                        with truePassword: String)
    {
        guard let userName = userName,
            let password = password else {
                callAlertWrongLoginOrPassword()
                return
        }
        guard userName == trueUserName && password == truePassword else {
            callAlertWrongLoginOrPassword()
            return
        }
        
    }
    
    private func callAlertWrongLoginOrPassword() {
        let alert = UIAlertController(title: "Wrong login or Password!",
                                      message: "Please enter true login and password",
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Try again",
                                        style: .default,
                                        handler: { (UIAlertAction) in
                                            self.passwordTextField.text = ""
                                            
        })
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
}


