//
//  ResumeView.swift
//  ResumeApp
//
//  Created by Yevhenii Vladichuk on 06.09.2022.
//

import Foundation
import UIKit

class ResumeView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 25
        layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.35
        layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.borderWidth = 1
    }
    
    
    
    
}
