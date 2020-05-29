//
//  UsersInfoViewController.swift
//  Login screen
//
//  Created by Nikita on 5/29/20.
//  Copyright © 2020 Nikita Begletskiy. All rights reserved.
//

import UIKit

class UsersInfoViewController: UIViewController {

    @IBOutlet weak var infoAboutUserTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoAboutUserTextView.text = User.getUser().information
    }
    
}
