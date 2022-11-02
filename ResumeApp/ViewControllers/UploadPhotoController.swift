//
//  UploadPhotoController.swift
//  ResumeApp
//
//  Created by Yevhenii Vladichuk on 21.09.2022.
//

import UIKit
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase


class UploadPhotoController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let newView = UIView()
    let imageView = UIImageView()
    let nextButton = UIButton()
    let skipButton = UIButton()
    let choosePhotoButton = UIButton()
    let homeVC = HomeViewController()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addElementsToTheUI()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Utilities.photoViewStyle(imageView)
    }

    
    func addElementsToTheUI() {
    //add new view
        newView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newView)
       
        newView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        newView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -125).isActive = true
        newView.heightAnchor.constraint(equalToConstant: 225).isActive = true
        newView.widthAnchor.constraint(equalToConstant: 225).isActive = true

    //add imageView to newView
        let margins = newView.layoutMarginsGuide
        imageView.translatesAutoresizingMaskIntoConstraints =  false
        newView.addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true

    //add choose photo button
        choosePhotoButton.setTitle("Сhoose photo", for: .normal)
        Utilities.styleClearButtonBlack(choosePhotoButton)
        choosePhotoButton.configuration = .plain()
        choosePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(choosePhotoButton)
        choosePhotoButton.addTarget(self, action: #selector(chooseButtonTapped), for: .touchUpInside)

        choosePhotoButton.topAnchor.constraint(equalTo: margins.bottomAnchor, constant: 25).isActive = true
        choosePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true

        choosePhotoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        choosePhotoButton.widthAnchor.constraint(equalToConstant: 185).isActive = true
        
        
    //add skip button
        skipButton.setTitle("Skip", for: .normal)
        skipButton.configuration = .plain()
        skipButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(skipButton)
        
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        
        skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    
        skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
        
        skipButton.widthAnchor.constraint(equalToConstant: 185).isActive = true
        skipButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    //add nextButton which upload photo to the DataBase and drop to the next view
        nextButton.setTitle("Next", for: .normal)
        Utilities.styleFilledButton(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints =  false
        view.addSubview(nextButton)
        
        nextButton.topAnchor.constraint(equalTo: choosePhotoButton.bottomAnchor, constant: 20).isActive = true
        
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 185).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        nextButton.alpha = 0
        nextButton.isEnabled = false
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    
    
    //choose photo to the imageView
        @objc func chooseButtonTapped(){
            let image = UIImagePickerController()
            image.delegate = self
            
            image.sourceType = .photoLibrary
            image.allowsEditing = true
            
            self.present(image, animated: true)
        }
    
    
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
             guard let image = info[.editedImage] as? UIImage else { return }
              
             dismiss(animated: true)

             imageView.image = image
            
            if imageView.image != nil {
                nextButton.alpha = 1
                nextButton.isEnabled = true
                
                skipButton.alpha = 0
                skipButton.isEnabled = false
            }
        }
          
    
    
        @objc func skipButtonTapped() {
            segue(id: "TabBarController")
        }
    
    
    
    //upload photo to the FireBase and show next view
         @objc func nextButtonTapped() {
            
             guard FirebaseAuth.Auth.auth().currentUser != nil else {return print ("something wrong")}
             guard imageView.image != nil else {return print("Doesn't see the photo")}
             
             let uid = FirebaseAuth.Auth.auth().currentUser!.uid
             
             let storageRef = Storage.storage().reference().child("usersPhoto").child("\(uid).jpg")
             
             let photo = imageView.image?.jpegData(compressionQuality: 1)
             
             storageRef.putData(photo!, metadata: nil) { (metadata, error) in
                 if error != nil {
                     print (error!)
                     return
                 }
                 print ("Upload success")
                 
                 if self.imageView.image == nil {
                     self.segue(id: "TabBarController")
                 } else {
                     sleep(1)
                     self.segue(id: "TabBarController")
                 }
            }
        }
    
    
    
    //segue to next view
        func segue(id: String ) {
        let nextView = storyboard?.instantiateViewController(withIdentifier: id)
        view?.window?.rootViewController = nextView
        view?.window?.makeKeyAndVisible()
    }
}
