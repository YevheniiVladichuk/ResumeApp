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
    @IBOutlet var alreadyHaveAccountBytton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func alreadyHaveAccountButtonTapped(_ sender: UIButton) {
    }
    
}
