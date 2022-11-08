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
    
    @IBOutlet var photoView: UIView!
    @IBOutlet var nameView: UIView!
    @IBOutlet var infoView: UIView!
    @IBOutlet var ageView: UIView!
    
    @IBOutlet var imageViewPhoto: UIImageView!
    @IBOutlet var logOutButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var cityCountryLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    let loadingView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logOutButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(loadingView)
        loadingViewConstraints()
        loadingView.addSubview(Utilities.activityIndicator)
        Utilities.activityIndicatorSetting(view: loadingView)
        Utilities.activityIndicator.startAnimating()
        checkIfUserLogedInAndFilTheField()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            Utilities.activityIndicator.stopAnimating()
            Utilities.activityIndicator.removeFromSuperview()
            self.loadingView.alpha = 0
            self.loadingView.removeFromSuperview()
        }
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            print ("Log out succesed")
            
        } catch let err {
            print ("Failed to sign out with error: \(err)")
            
        }
        Utilities.segue(vc: self, id: "LoginVC")
    }
    
    
    //check if loged in and fill information
    func checkIfUserLogedInAndFilTheField() {
        
        guard let uid = FirebaseAuth.Auth.auth().currentUser?.uid else {return}
        
        FirebaseDatabase.Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (DataSnapshot) in
            if let dictionary =  DataSnapshot.value as? [String: String] {
                //upadte labels
                self.nameLabel.text = dictionary["name"]
                self.lastNameLabel.text = dictionary["lastName"]
                self.ageLabel.text = dictionary["age"]
                self.cityCountryLabel.text = dictionary ["cityCountry"]
                self.phoneNumberLabel.text = dictionary ["phoneNumber"]
            }
        })
        //fetch photo to the UIImageView
        let storageRef = Storage.storage().reference(withPath: "usersPhoto/\(uid).jpg")
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
    }
    
    func loadingViewConstraints() {
        loadingView.alpha = 1
        loadingView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
}

