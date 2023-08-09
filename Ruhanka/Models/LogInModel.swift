//
//  LogInModel.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 09.08.2023.
//

import UIKit

struct LogInModel {
    
    //MARK: -  Create reset Password view
    func resetPassword(from viewController: UIViewController) {
        // Declare Alert message
        let dialogMessage = UIAlertController(title: "Відновлення паролю", message: "Для відновлення паролю введіть вашу пошту на натисніть Ok. \n \n Інструкція по відновленню буде вислана вам на пошту.", preferredStyle: .alert)

        // Add text field
        dialogMessage.addTextField(configurationHandler: { textField in
            textField.placeholder = "Введіть вашу пошту."
        })
        
        //Create Cancen button with action handler
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
            guard let myVC = viewController as? LogInVC,
                  let email = dialogMessage.textFields?.first?.text
            else {
                return
            }

            
            if email.isEmpty {
                let placeholderText = "Ви не ввели пошту"
                let placeholderColor = UIColor.red
                let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: placeholderColor]
                let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
                dialogMessage.textFields?.first?.attributedPlaceholder = attributedPlaceholder
                myVC.passwordResetHint.isHidden = false
                myVC.passwordResetHint.text = "Test"
               
                

            } else {
                myVC.sendPasswordReset(withEmail: email)
                myVC.passwordResetHint.isHidden = false
            }
            
        })
        
        // add cancel and ok buttons
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        //show alert message to user
        viewController.present(dialogMessage, animated: true, completion: nil)
    }

}
