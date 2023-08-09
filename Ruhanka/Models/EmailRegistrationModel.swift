//
//  EmailRegistatinModel.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 06.07.2023.
//

import UIKit


struct EmailRegistrationModel {
    
    //MARK: -  checkPasswordStrength

    func checkPasswordStrength(_ password: String) -> Bool {
        // Check for at least 8 characters
        if password.count < 8 {
            return false
        }
        
        // Check for at least one capital letter
        let capitalLetterRegex = ".*[A-Z]+.*"// create a regular expression pattern
        let capitalLetterPredicate = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegex)
        if !capitalLetterPredicate.evaluate(with: password) {
            return false
        }
        

        // Check for at least one number
        let numberRegex = ".*\\d+.*"
        let numberPredicate = NSPredicate(format: "SELF MATCHES %@", numberRegex)
        if !numberPredicate.evaluate(with: password) {
            return false
        }
        
        // Check for at least one special symbol
        let specialSymbolRegex = ".*[!@#$%^&*(),.?\":{}|<>]+.*"
        let specialSymbolPredicate = NSPredicate(format: "SELF MATCHES %@", specialSymbolRegex)
        if !specialSymbolPredicate.evaluate(with: password) {
            return false
        }
        
        // Password meets all requirements
        return true
    }
    
}





