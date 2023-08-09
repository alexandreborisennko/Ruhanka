//
//  ViewController.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 04.07.2023.
//

import UIKit

class AuthorizationVC: UIViewController {
    @IBOutlet weak var appleButton: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func emailButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: EmailRegistrationVC.identifier) as? EmailRegistrationVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func loginButton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: LogInVC.identifier) as? LogInVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}



