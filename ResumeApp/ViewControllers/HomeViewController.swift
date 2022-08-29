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

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backToWelcomeBtnTapped(_ sender: UIButton) {
    }
    
    
    
    @IBAction func LogOut(_ sender: UIButton) {
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            print (error)
//        }
        segue(id: "LoginVC")
    }
    
    
    //segue to the next view
    func segue(id: String) {
        let nextView = storyboard?.instantiateViewController(withIdentifier: id)
        view?.window?.rootViewController = nextView
        view?.window?.makeKeyAndVisible()
    }
}
