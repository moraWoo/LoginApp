//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Ildar Khabibullin on 14.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var logOutButton: UIButton!
    @IBOutlet var userNameLogin: UILabel!
    
    var userNameLoginLabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLogin.text = userNameLoginLabel
    }
    
    @IBAction func buttonLogOut() {
        dismiss(animated: true)
        print(2)
    }
}
