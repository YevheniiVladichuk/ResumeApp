//
//  Utilities.swift
//  ResumeApp
//
//  Created by Yevhenii Vladichuk on 19.08.2022.
//

import Foundation
import UIKit

class Utilities {
    
    //clear button style (white tint)
    static func styleClearButtonWhite(_ button: UIButton) {
        button.layer.borderWidth = 0.75
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    //style of clear button (black tint)
    static func styleClearButtonBlack(_ button: UIButton) {
        button.layer.borderWidth = 0.75
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    //style of filled button
    static func styleFilledButton(_ button: UIButton) {
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    //style of text fields
    static func styleTextField(_ textField: UITextField) {
        //Bottom line
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 38, width: textField.frame.width, height: 1.5)
        
        bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        //remove border from text field
        textField.borderStyle = .none
        
        //add the line to the text field
        textField.layer.addSublayer(bottomLine)
        
        //color
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
    //password check
    static func checkPassword(_ passord: String) -> Bool {
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordCheck.evaluate(with: passord)
    }
    
    //photo view style
    static func photoViewStyle(_ view:UIView) {
        
        let view = view
        view.layer.cornerRadius = view.layer.bounds.width/2
        view.clipsToBounds = true
        view.layer.borderWidth = 0.25
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.backgroundColor = #colorLiteral(red: 0.9215685725, green: 0.9215685725, blue: 0.9215685725, alpha: 1)
    }
    //UI elements style
    static func viewStyle(_ view: UIView) {
        view.layer.cornerRadius = 25
        view.layer.shadowColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.4
        view.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        view.layer.borderWidth = 0.5
    }
    static func activityIndicator()-> UIActivityIndicatorView {
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        
        activityIndicator.alpha = 1
        activityIndicator.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        activityIndicator.hidesWhenStopped = true
        
        
        return activityIndicator
    }
}
