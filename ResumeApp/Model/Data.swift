//
//  Data.swift
//  ResumeApp
//
//  Created by Yevhenii Vladichuk on 07.11.2022.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class UserData {
    
    var name: String?
    var lastName: String?
    var age: String?
    var cityCountry: String?
    var phoneNumber: String?
    
    
    
    func fetchData(viewController: UIViewController) {
        
    
        guard let uid = FirebaseAuth.Auth.auth().currentUser?.uid else {return}
        
        FirebaseDatabase.Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (DataSnapshot) in
            guard let dictionary =  DataSnapshot.value as? [String: String] else {return}
            
            self.name = dictionary["name"]
            self.lastName = dictionary["lastName"]
            self.age = dictionary["age"]
            self.cityCountry = dictionary["cityCountry"]
            self.phoneNumber = dictionary["phoneNumber"]
        })
        

    }
    
    
}
