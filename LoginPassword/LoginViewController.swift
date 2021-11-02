//
//  ViewController.swift
//  LoginPassword
//
//  Created by Yuriy  on 02.11.2021.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IB Outlets
    
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var userName: UITextField!
    
    // MARK: - Private properties
    private let user = "User"
    private let password = "Passowrd"
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = user
    }
    
    // MARK: IBAction
    @IBAction func login() {
        if userName.text != user && passwordText.text != password {
           showAlert(title: "Invalid login or password", message: "Please, enter correct login and password", textField: passwordText )
          
        }
        func viewDidLoad() {super.viewDidLoad()}

}
    @IBAction func forgotName(_ sender: Any) {
        showAlert(title: "Your login", message: "User")
    }
    @IBAction func forgotPass(_ sender: Any) {
        showAlert(title: "Your password", message: "Password")
    }
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userName.text = ""
        passwordText.text = ""
    }
}
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Alert Controller
extension LoginViewController: UITextFieldDelegate {
    // если тапнуть по свободному месту то скрывается клавиатура
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
   // переход в след окно, кнопка некст в клавиатуре
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userName {
            passwordText.becomeFirstResponder()
        } else {
            login() // вызывается функ
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
    return true
    }
}
