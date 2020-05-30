//
//  UsersInfoViewController.swift
//  Login screen
//
//  Created by Nikita on 5/29/20.
//  Copyright © 2020 Nikita Begletskiy. All rights reserved.
//

import UIKit

class UsersInfoViewController: UIViewController {

    @IBOutlet weak var bannerLabel: UILabel!
    @IBOutlet weak var infoAboutUserTextView: UITextView!
    @IBOutlet weak var usersInfoChanger: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerLabel.text = "Немного обо мне:"
        infoAboutUserTextView.text = User.getUser().aboutMe
    }
    
    
    @IBAction func changeUsersInfo(_ sender: UISegmentedControl) {
        
        switch usersInfoChanger.selectedSegmentIndex {
        case 0:
            bannerLabel.text = "Немного обо мне:"
            infoAboutUserTextView.text = User.getUser().aboutMe
        case 1:
            bannerLabel.text = "Немного об учебе:"
            infoAboutUserTextView.text = User.getUser().aboutStudy
        default:
            print("Something wrong!")
        }
        
    }
    
}
