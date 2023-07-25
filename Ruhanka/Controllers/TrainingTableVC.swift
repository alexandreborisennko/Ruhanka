//
//  TrainingTableVC.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 25.07.2023.
//

import UIKit

class TrainingTableVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.mainNibName, bundle: nil), forCellReuseIdentifier: K.mainReusableCell)
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var tableView: UITableView!
    
}

extension TrainingTableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}

extension TrainingTableVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
}

