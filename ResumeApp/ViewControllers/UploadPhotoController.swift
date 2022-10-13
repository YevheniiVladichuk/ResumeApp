//
//  UploadPhotoController.swift
//  ResumeApp
//
//  Created by Yevhenii Vladichuk on 21.09.2022.
//

import UIKit

class UploadPhotoController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let newView = UIView()
    let imageView = UIImageView()
    let nextButton = UIButton()
    let skipButton = UIButton()
    let uploadButton = UIButton()
    
    
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

    //add upload button
        
        uploadButton.setTitle("Сhoose photo", for: .normal)
        Utilities.styleFilledButton(uploadButton)
        uploadButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uploadButton)
        uploadButton.addTarget(self, action: #selector(chooseButtonTapped), for: .touchUpInside)


        uploadButton.topAnchor.constraint(equalTo: margins.bottomAnchor, constant: 25).isActive = true
        uploadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true

        uploadButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        uploadButton.widthAnchor.constraint(equalToConstant: 185).isActive = true
        
        
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
        nextButton.configuration = .plain()
        nextButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nextButton.translatesAutoresizingMaskIntoConstraints =  false
        view.addSubview(nextButton)
        
        nextButton.topAnchor.constraint(equalTo: uploadButton.bottomAnchor, constant: 20).isActive = true
        
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 185).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        nextButton.alpha = 0
        nextButton.isEnabled = false
        
    }
    
    //Upload photo to th imageView
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
    
    //segue to next view
        func segue(id: String ) {
        let nextView = storyboard?.instantiateViewController(withIdentifier: id)
        view?.window?.rootViewController = nextView
        view?.window?.makeKeyAndVisible()
    }
    
}
