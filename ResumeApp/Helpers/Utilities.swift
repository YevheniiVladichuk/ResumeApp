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
    
    //Style of clear button (black tint)
    static func styleClearButtonBlack(_ button: UIButton) {
        button.layer.borderWidth = 0.75
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    //Style of filled button
    static func styleFilledButton(_ button: UIButton) {
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    //Style of text fields
    static func styleTextField(_ textField: UITextField) {
        //Bottom line
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 38, width: textField.frame.width, height: 1.5)
        
        bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        //Remove border from text field
        textField.borderStyle = .none
        
        //Add the line to the text field
        textField.layer.addSublayer(bottomLine)
        
        //Color
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    //Password check
    static func checkPassword(_ passord: String) -> Bool {
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordCheck.evaluate(with: passord)
    }
    
}
