//
//  EmailRegistrationVC.swift
//  Ruhanka
//
//  Created by Mac on 05.07.2023.
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
    //MARK: -  makeRoundCornersForTextOutlet, Function that makes round corners for Text Inputs
    
    func makeRoundCornersForTextOutlet(for textFields: UITextField...) { //... is a variadic parameter
        
        for textField in textFields {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = #colorLiteral(red: 0.6571641564, green: 0.6571640372, blue: 0.6571640372, alpha: 1)
            textField.layer.cornerRadius = 10
            textField.layer.masksToBounds = true
        }
    }
    
}
