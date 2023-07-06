//
//  MakeRoundCornersForTextOutlet.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 06.07.2023.
//

import UIKit

func makeRoundCornersForTextOutlet(for textFields: UITextField...) { //... is a variadic parameter
    
    for textField in textFields {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.6571641564, green: 0.6571640372, blue: 0.6571640372, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
    }
}
