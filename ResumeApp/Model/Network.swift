//
//  Main.swift
//  ResumeApp
//
//  Created by Yevhenii Vladichuk on 08.11.2022.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase


class Network {
    
    static var userData:[String:String]?
    
    //checks if data is correct, executes login to the HomeVC
    static func login(email: String, password: String, errorLabel: UILabel, currentVC: UIViewController) {
        
        let email = email
        let password = password
        let errorLabel = errorLabel
        let currentVC = currentVC
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print ("Failed to Log In with an error: \(error!.localizedDescription)")
                self.showError(error: "Check your data or sign up", label: errorLabel)
                return
            } else {
                    Utilities.segue(vc: currentVC, id: "TabBarController")
                    print ("Logged in success")
            }
        }
    }
    
    //shows error message
    static func showError(error: String, label: UILabel) {
        let errorLabel = label
        errorLabel.alpha = 1
        errorLabel.text! = error
    }
    
}
