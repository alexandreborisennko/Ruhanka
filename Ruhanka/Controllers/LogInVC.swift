//
//  LogInVC.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 06.07.2023.
//

import UIKit
import FirebaseAuth

class LogInVC: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barStyle = .default
        makeRoundCornersForTextOutlet(for: emailOutlet,passwordOutlet)
        addTapGestureToDismissKeyboard() // function to dismiss keyboard on tap
        emailOutlet.delegate = self
        passwordOutlet.delegate = self

    }

    @IBOutlet weak var passwordResetHint: UILabel!
    
    
    @IBAction func forgetPassword(_ sender: UIButton) {
        resetPassword(from: self)
    }
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        if let email = emailOutlet.text, let password = passwordOutlet.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    createAlert(from: self, errorText: e.localizedDescription)
                    print(e)
                } else {
                    self.performSegue(withIdentifier: "LoginToCourses", sender: self)
                }
            }
        }
    }
    
    func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            callback?(error)
        }
    }
    


}

