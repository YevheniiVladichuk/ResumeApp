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
import FirebaseStorageUI

class HomeViewController: UIViewController {

    @IBOutlet var imageViewPhoto: UIImageView!
    @IBOutlet var logOutButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var cityCountryLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    let waitingView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(waitingView)
        
        waitingView.translatesAutoresizingMaskIntoConstraints = false
        waitingView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        waitingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        waitingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        waitingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        waitingView.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        waitingView.alpha = 1
        
        //button
        logOutButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        //upload data
        checkIfUserLogedIn()
        
        //activity indicator
        showIndicator()
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
    
    
    //check if loged in and fill information
    func checkIfUserLogedIn() {
        
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
                })
                
                //fetch photo to the UIImageView
                let storageRef = Storage.storage().reference(withPath: "usersPhoto/\(uid!).jpg")
                let placeHolder = UIImage(named: "placeholder.jpg")
            
                imageViewPhoto.sd_setImage(with: storageRef, placeholderImage: placeHolder)
                imageViewPhoto.contentMode = .scaleAspectFill
                imageViewPhoto.layer.cornerRadius = 25
                imageViewPhoto.layer.shadowColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
                imageViewPhoto.layer.shadowOffset = CGSize(width: 0, height: 0)
                imageViewPhoto.layer.shadowRadius = 5
                imageViewPhoto.layer.shadowOpacity = 0.4
                imageViewPhoto.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                imageViewPhoto.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
                imageViewPhoto.layer.borderWidth = 0.5
        }else {
            return
        }
    }
    
    
    //activity indicator
    func showIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        waitingView.addSubview(activityIndicator)
        activityIndicator.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: waitingView.centerXAnchor, constant: 0).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: waitingView.centerYAnchor, constant: 0).isActive = true
        activityIndicator.heightAnchor.constraint(equalToConstant: 25).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 25).isActive = true
        activityIndicator.startAnimating()
    }
    
    
    //segue to the next view
    func segue(id: String) {
        let nextView = storyboard?.instantiateViewController(withIdentifier: id)
        view?.window?.rootViewController = nextView
        view?.window?.makeKeyAndVisible()
    }
}
