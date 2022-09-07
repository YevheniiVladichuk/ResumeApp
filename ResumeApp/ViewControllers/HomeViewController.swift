//
//  HomeViewController.swift
//  ResumeApp
//
//  Created by Yevhenii Vladichuk on 19.08.2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class HomeViewController: UIViewController {

    @IBOutlet weak var nameLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   
    @IBAction func LogOut(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            segue(id: "LoginVC")
            print ("Log out succesed")
        } catch let err {
            print ("Failed to sign out with error: \(err)")
        }
    }
    
    
    //segue to the next view
    func segue(id: String) {
        let nextView = storyboard?.instantiateViewController(withIdentifier: id)
        view?.window?.rootViewController = nextView
        view?.window?.makeKeyAndVisible()
    }
    
   
    }
