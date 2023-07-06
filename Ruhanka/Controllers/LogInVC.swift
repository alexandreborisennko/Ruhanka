//
//  LogInVC.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 06.07.2023.
//

import UIKit

class LogInVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        makeRoundCornersForTextOutlet(for: emailOutlet,passwordOutlet)

    }

    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBAction func loginButton(_ sender: UIButton) {
    }
    

}

