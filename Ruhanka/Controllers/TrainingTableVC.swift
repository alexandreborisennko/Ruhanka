//
//  TrainingTableVC.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 25.07.2023.
//

import UIKit

class TrainingTableVC: UIViewController {
    var courseTraining: [CoursePartBlock] = []
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.mainNibName, bundle: nil), forCellReuseIdentifier: K.mainReusableCell)
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var testOutlet: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
}

extension TrainingTableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  courseTraining.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.mainReusableCell, for: indexPath) as! MainCell //create reusable cell with all properties of custom cell
        cell.mainTag.text = courseTraining[indexPath.row].blockTag
        cell.mainName.text =  courseTraining[indexPath.row].blockName
        cell.mainImage.image = courseTraining[indexPath.row].blockImage
        cell.mainImage.makeRoundCorners(byRadius: 20)
       // cell.mainImage.image = UIImage(named: "training1")
        return cell
        
    }
    
}

extension TrainingTableVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
 
 

