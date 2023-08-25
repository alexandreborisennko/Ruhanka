//
//  TrainingTableVC.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 25.07.2023.
//

import UIKit

class TrainingTableVC: UIViewController {
   internal var courseTraining: [CoursePartBlock] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainCell.nib(), forCellReuseIdentifier: MainCell.identifier)
    }
    

    @IBOutlet weak var testOutlet: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
}

extension TrainingTableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  courseTraining.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier, for: indexPath) as? MainCell  else {
            return UITableViewCell()
        }
        cell.mainTag.text = courseTraining[indexPath.row].blockTag
        cell.mainName.text =  courseTraining[indexPath.row].blockName
        cell.mainImage.image = courseTraining[indexPath.row].blockImage
        cell.mainImage.makeRoundCorners(byRadius: 20)
        return cell
        
    }
    
}

extension TrainingTableVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
 
 

