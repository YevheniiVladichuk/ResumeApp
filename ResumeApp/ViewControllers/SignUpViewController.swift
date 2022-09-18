//
//  SignUpViewController.swift
//  ResumeApp
//
//  Created by Yevhenii Vladichuk on 19.08.2022.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class SignUpViewController: UIViewController {
    @IBOutlet var mainStackView: UIStackView!
    
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var alreadyHaveAccountBytton: UIButton!
    
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
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        self.view.endEditing(true)
        let error = checkFields()
        guard error == nil else {return showError(error: error!)}
        creatNewUser()
    
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
    
    //check the fields
    func checkFields()-> String? {
        if firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Sorry, you need to fil all fields !"
        }
        
     return nil
    }
    
    //show error message
    func showError(error: String) {
        errorLabel.alpha = 1
        errorLabel.text! = error
    }
    
    //creat new user
    func creatNewUser() {
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { authResult, error in
            if error != nil {
                self.showError(error: error!.localizedDescription)
                print (error!.localizedDescription)
                return
            }
            guard let uid = authResult?.user.uid else {return}
            let values = ["email": self.emailField.text!, "name": self.firstNameField.text!, "lastName": self.lastNameField.text!]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values) { error, ref in
                if error != nil {
                    print ("Failed to update database values with an error: \(error!.localizedDescription)")
                    return
            }
            
            }
            self.segue(id: "LoginVC")
            print ("Succesfully signed up")
       }
    }
    
}

