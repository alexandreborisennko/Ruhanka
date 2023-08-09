//
//  LogInVC.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 06.07.2023.
//

import UIKit
import FirebaseAuth

class LogInVC: UIViewController, UITextFieldDelegate, CreateAlert {
    private let logInModel = LogInModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        addTapGestureToDismissKeyboard() // function to dismiss keyboard on tap
        emailOutlet.delegate = self
        passwordOutlet.delegate = self
    }

    @IBOutlet weak var passwordResetHint: UILabel!
    
    
    @IBAction func forgetPassword(_ sender: UIButton) {
        logInModel.resetPassword(from: self)
    }
    
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        if let email = emailOutlet.text, let password = passwordOutlet.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.createAlert(from: self, errorText: e.localizedDescription)
                    print(e)
                } else {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let vc = storyboard.instantiateViewController(withIdentifier: AvailableCoursesVC.identifier) as? AvailableCoursesVC {
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                    
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

extension LogInVC {
    
    private func setUI() {
        navigationController?.navigationBar.barStyle = .default
        makeRoundCornersForTextOutlet(for: emailOutlet,passwordOutlet)
    }
}

