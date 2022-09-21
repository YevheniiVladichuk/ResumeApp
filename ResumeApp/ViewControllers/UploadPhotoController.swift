//
//  UploadPhotoController.swift
//  ResumeApp
//
//  Created by Yevhenii Vladichuk on 21.09.2022.
//

import UIKit

class UploadPhotoController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        addElementsToTheUI()
    }

    func addElementsToTheUI() {
        
    //add new view
        let newView = UIView()
        newView.backgroundColor = #colorLiteral(red: 0.1046463028, green: 0.107996963, blue: 0.1236616001, alpha: 1)
        newView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newView)

        newView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        newView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -125).isActive = true
        newView.heightAnchor.constraint(equalToConstant: 225).isActive = true
        newView.widthAnchor.constraint(equalToConstant: 225).isActive = true

    //add iImageView to NewView
        let imageView = UIImageView()
        let margins = newView.layoutMarginsGuide
        imageView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints =  false
        newView.addSubview(imageView)

        imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true

    //add upload button
        let uploadButton = UIButton()
        uploadButton.setTitle("Upload photo", for: .normal)
        Utilities.styleFilledButton(uploadButton)
        uploadButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uploadButton)
        uploadButton.addTarget(self, action: #selector(uploadButtonTapped), for: .touchUpInside)


        uploadButton.topAnchor.constraint(equalTo: margins.bottomAnchor, constant: 25).isActive = true
        uploadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true

        uploadButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        uploadButton.widthAnchor.constraint(equalToConstant: 185).isActive = true
        
        
    //add skip button
        let skipButton = UIButton()
        skipButton.setTitle("Skip", for: .normal)
        skipButton.configuration = .plain()
        skipButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(skipButton)
        
        skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    
        
        skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
        
        skipButton.widthAnchor.constraint(equalToConstant: 185).isActive = true
        skipButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    @objc func uploadButtonTapped() {
        
    }
    


}
