//
//  WelcomeViewController.swift
//  Login screen
//
//  Created by Nikita on 5/29/20.
//  Copyright © 2020 Nikita Begletskiy. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    
    var greeting: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let greeting = self.greeting else { return }
        greetingLabel.text = "Welcome, \(greeting) !"
    }
    
    
    // MARK: Exit to LoginViewController
    @IBAction func logOut(_ sender: UIButton) {
    }
    
}
