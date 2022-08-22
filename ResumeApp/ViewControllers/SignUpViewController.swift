//
//  SignUpViewController.swift
//  ResumeApp
//
//  Created by Yevhenii Vladichuk on 19.08.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var alreadyHaveAccountBytton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stylizeElements()

    }
    
    //keyboard disappear by tap anywhere view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
             self.view.endEditing(true)
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
      
    }
    
    
    @IBAction func alreadyHaveAccountButtonTapped(_ sender: UIButton) {
        segue(id: "LoginVC")
    }
    
    //buttons and fields style
    func stylizeElements() {
        Utilities.styleTextField(firstNameField)
        Utilities.styleTextField(lastNameField)
        Utilities.styleTextField(emailField)
        Utilities.styleTextField(passwordField)
        
        Utilities.styleFilledButton(signUpButton)
        errorLabel.alpha = 0
        alreadyHaveAccountBytton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        addPlaceholder()
    }
    
    //add placeholder with opacity
    func addPlaceholder() {
        firstNameField.attributedPlaceholder = NSAttributedString(string: "First name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.5)])
        lastNameField.attributedPlaceholder = NSAttributedString(string: "Last name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.5)])
        emailField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.5)])
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.5)])
    }
    
    //segue to the next view
    func segue(id: String) {
        let nextView = storyboard?.instantiateViewController(withIdentifier: id)
        view?.window?.rootViewController = nextView
        view?.window?.makeKeyAndVisible()
    }
    
    
    
}
