//
//  EmailRegistrationVC.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 05.07.2023.
//

import UIKit
import FirebaseAuth

class EmailRegistrationVC: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate {
    

    
    

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var emailFieldOutlet: UITextField!
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var surnameOutlet: UITextField!
    @IBOutlet weak var birthDateOutlet: UITextField!
    @IBOutlet weak var checkboxOutlet: UIButton!
    @IBOutlet weak var passwordHint: UILabel!
    
    @IBOutlet weak var checkboxText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeRoundCornersForTextOutlet(for: emailFieldOutlet,passwordOutlet,nameOutlet,surnameOutlet,birthDateOutlet)
        emailFieldOutlet.delegate = self // setting self as delegate to use textFieldShouldReturn
        passwordOutlet.delegate  = self
        nameOutlet.delegate = self
        surnameOutlet.delegate = self
        birthDateOutlet.delegate = self
        
        // Add a tap gesture recognizer to the view
              let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
              view.addGestureRecognizer(tapGesture)
        
        
    }
    

    @IBAction func passwordDidStartEditing(_ sender: UITextField) {
        passwordHint.isHidden = false
        passwordHint.text = "Підказка: пароль має містити мінімум 8 символів англійскою, включая:  1 спецсімвол,1 цифру та 1 заглавну букву"
    }
    @IBAction func passwordDidEndEditing(_ sender: UITextField) {
        passwordHint.isHidden = true
        

    }
    @IBAction func btnClicked(_ sender: UIButton) {
       
    }
  
    


 
    //MARK: -  Chechbox selection

    @IBAction func checkBoxPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        checkboxText.textColor = #colorLiteral(red: 0.5920000076, green: 0.5920000076, blue: 0.5920000076, alpha: 1)
    }
    
    
    @IBAction func registrationButtonPressed(_ sender: UIButton) {

        
        if let email = emailFieldOutlet.text, let password = passwordOutlet.text {
            let isStrongPassword = checkPasswordStrength(password)
            
            if isStrongPassword {
                
                // perform checking if checkbox is enabled
                if self.checkboxOutlet.isSelected {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let e = error {
                        createAlert(from: self, errorText: e.localizedDescription) //show alert with error
                        
                    } else {
                            
                            //navigate to next screen
                            self.performSegue(withIdentifier: "LoginToCourses", sender: self)
                    }
                }
                    
                } else {
                    checkboxText.shake(duration: 0.5, values: [-12.0, 12.0, -12.0, 12.0, -6.0, 6.0, -3.0, 3.0, 0.0])
                    checkboxText.textColor = .red
                }
                
            } else { // if password doesn't match checkPasswordStrength condition:
                let errorMessage = "Пароль не відповідає умовам! \nБудь ласка створіть пароль з наступними умовами:\n\n- мінімум 8 символов\n - мінімум одна заглавна буква\n -мінімум одна цифра\n - мінімум один спецсимвол.\n"
                createAlert(from: self, errorText: errorMessage) //show alert with error
            }
        }
    }
    



    
    @objc func dismissKeyboard() { //dismiss keyboard when clicking on blank area on UIViewController
        view.endEditing(true)
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



