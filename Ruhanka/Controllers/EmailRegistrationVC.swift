//
//  EmailRegistrationVC.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 05.07.2023.
//

import UIKit

class EmailRegistrationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        makeRoundCornersForTextOutlet(for: emailFieldOutlet,passwordOutlet,nameOutlet,surnameOutlet,birthDateOutlet)
    }
    
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var emailFieldOutlet: UITextField!
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var surnameOutlet: UITextField!
    @IBOutlet weak var birthDateOutlet: UITextField!
    
    @IBAction func checkBoxPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    

  
    
}
