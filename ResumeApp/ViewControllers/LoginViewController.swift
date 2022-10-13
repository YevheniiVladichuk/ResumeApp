//
//  LoginViewController.swift
//  ResumeApp
//
//  Created by Yevhenii Vladichuk on 19.08.2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        stylizeElements()
    }
    
    
    //keyboard disappear by tap anywhere view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
             self.view.endEditing(true)
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let error = chekFields()
        guard error == nil else {return showError(error: error!)}
        login()
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        segue(id: "SignUpVC")
    }
    
    
    
    //style
    func stylizeElements() {
        Utilities.styleTextField(emailField)
        Utilities.styleTextField(passwordField)
        Utilities.styleFilledButton(logInButton)
        signUpButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        errorLabel.alpha = 0
        
        //add placeholder
        emailField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.5)])
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.5)])
    }
    
    
    //segue to the next view
    func segue(id: String) {
        let nextView = storyboard?.instantiateViewController(withIdentifier: id)
        view?.window?.rootViewController = nextView
        view?.window?.makeKeyAndVisible()
    }
    
    //check fields
    func chekFields() -> String? {
        self.view.endEditing(true)
        if emailField.text?.isEmpty == true || passwordField.text?.isEmpty == true {
            
            return "You need to fill all fields !"
        }
        return nil
    }
    
    
    //show error message
    func showError(error: String) {
        errorLabel.alpha = 1
        errorLabel.text! = error
    }
    
    //login
    func login() {
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { authResult, error in
            if error != nil {
                print ("Failed to Log In with an error: \(error!.localizedDescription)")
                self.showError(error: "Check your data or sign up")
                return
            }else {
                self.segue(id: "TabBarController")
                print ("Log In succesed")
            }
        }

     }
    

}
