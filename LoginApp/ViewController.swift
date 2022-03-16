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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userNameForLabel = segue.destination as? LoginViewController else { return }
        userNameForLabel.userNameLoginLabel = loginTextField.text
    }
    
    @IBAction func showAuthorizationData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", message: "You User Name is User 😉")
            : showAlert(title: "Oops!", message: "You password is Password 😉")
    }
    
    
    
    @IBAction func pressedLogin(_ sender: UIButton) {
        if loginTextField.text != "User" || passwordTextField.text != "Password" {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
            return
        } else {
            performSegue(withIdentifier: "segueForLogin", sender: nil)
        }
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
}

// MARK: - Extension
extension ViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with:event)
        view.endEditing(true)
    }
}
