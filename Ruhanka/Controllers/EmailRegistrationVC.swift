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
        navigationController?.navigationBar.barStyle = .default

        makeRoundCornersForTextOutlet(for: emailFieldOutlet,passwordOutlet,nameOutlet,surnameOutlet,birthDateOutlet)
        
        emailFieldOutlet.delegate = self // setting self as delegate to use textFieldShouldReturn
        passwordOutlet.delegate  = self
        nameOutlet.delegate = self
        surnameOutlet.delegate = self
        birthDateOutlet.delegate = self
        
        addTapGestureToDismissKeyboard() // function to dismiss keyboard on tap
        
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
    
    
    //MARK: -  registrationButtonPressed

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
                            self.performSegue(withIdentifier: "EmailRegisterToCourses", sender: self)
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
    



}





