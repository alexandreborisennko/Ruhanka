//
//  EmailRegistatinModel.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 06.07.2023.
//

import UIKit

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


//MARK: -  CreateAlert with error when pressing Registration button

func createAlert(from viewController:UIViewController, errorText error:String) {
    // Create a new alert
    
    let dialogMessage = UIAlertController(title: "Увага", message:error, preferredStyle: .alert)
    
    // Create OK button with action handler
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        //print("Ok button tapped")
    })
    //Add OK button to a dialog message
    dialogMessage.addAction(ok)

    // Present alert to user
    viewController.present(dialogMessage, animated: true, completion: nil)
    
}


//MARK: -  makeRoundCornersForTextOutlet

func makeRoundCornersForTextOutlet(for textFields: UITextField...) { //... is a variadic parameter
    
    for textField in textFields {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.6571641564, green: 0.6571640372, blue: 0.6571640372, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
    }
}



extension UIViewController {
    
    
    //MARK: -  Function to dismiss keyboard on tap
    func addTapGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    //MARK: -  textFieldShouldReturn - dismiss keyboard when clicking in viewController

    @objc  func textFieldShouldReturn(_ textField: UITextField) -> Bool { //dismiss keyboard when clicking enter key on keyboard
        textField.resignFirstResponder()
        return true
    }
}



//MARK: -  UIView extension for button to shake

extension UIView {


    // Using CAMediaTimingFunction
    func shake(duration: TimeInterval = 0.5, values: [CGFloat]) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")

        // Swift 4.2 and above
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)

        // Swift 4.1 and below
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)


        animation.duration = duration // You can set fix duration
        animation.values = values  // You can set fix values here also
        self.layer.add(animation, forKey: "shake")
    }


    // Using SpringWithDamping
    func shake(duration: TimeInterval = 0.5, xValue: CGFloat = 12, yValue: CGFloat = 0) {
        self.transform = CGAffineTransform(translationX: xValue, y: yValue)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)

    }


    // Using CABasicAnimation
    func shake(duration: TimeInterval = 0.05, shakeCount: Float = 6, xValue: CGFloat = 12, yValue: CGFloat = 0){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = shakeCount
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - xValue, y: self.center.y - yValue))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + xValue, y: self.center.y - yValue))
        self.layer.add(animation, forKey: "shake")
    }

}
