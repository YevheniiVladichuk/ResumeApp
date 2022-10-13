//
//  HomeViewController.swift
//  ResumeApp
//
//  Created by Yevhenii Vladichuk on 19.08.2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase

class HomeViewController: UIViewController {

    @IBOutlet var logOutButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var cityCountryLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logOutButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        checkIfUserLogedId()
        
    }
    
   
    
   
    @IBAction func logOut(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            print ("Log out succesed")
        } catch let err {
            print ("Failed to sign out with error: \(err)")
        }
        
        segue(id: "LoginVC")
    }
    
    //check loged in
    func checkIfUserLogedId() {
        
        if FirebaseAuth.Auth.auth().currentUser?.uid != nil {
            let uid = FirebaseAuth.Auth.auth().currentUser?.uid
            FirebaseDatabase.Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (DataSnapshot) in
                if let dictionary =  DataSnapshot.value as? [String: String] {
                    self.nameLabel.text = dictionary["name"]
                    self.lastNameLabel.text = dictionary["lastName"]
                    self.ageLabel.text = dictionary["age"]
                    self.cityCountryLabel.text = dictionary ["cityCountry"]
                    self.phoneNumberLabel.text = dictionary ["phoneNumber"]
                }
            } )
        }else {
            return
        }
    }
    
    //segue to the next view
    func segue(id: String) {
        let nextView = storyboard?.instantiateViewController(withIdentifier: id)
        view?.window?.rootViewController = nextView
        view?.window?.makeKeyAndVisible()
    }
    
   
    }
