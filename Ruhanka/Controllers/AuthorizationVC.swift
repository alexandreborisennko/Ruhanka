//
//  ViewController.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 04.07.2023.
//

import UIKit

class AuthorizationVC: UIViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


    }

    @IBOutlet weak var appleButton: UIButton!
       
    
}



