//
//  ViewController.swift
//  LoginApp
//
//  Created by Ildar Khabibullin on 14.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var buttonLogIn: UIButton!
    
    @IBOutlet var buttonForgotUserName: UIButton!
    @IBOutlet var buttonForgotPassword: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userNameForLabel = segue.destination as? LoginViewController else { return }
        userNameForLabel.userNameLoginLabel = loginTextField.text
    }

    @IBAction func pressedForgotUserName() {
        showAlert(title: "Oops!", message: "You User Name is User 😉")
    }

    @IBAction func pressedForgotPassword() {
        showAlert(title: "Oops!", message: "You password is Password 😉")
    }
    
    @IBAction func pressedLogin() {
        if loginTextField.text != "User" || passwordTextField.text != "Password" {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
            return
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
}

// MARK: - Extension
extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ViewController {
    private func showAlertWrongLogin(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
