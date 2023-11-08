//
//  PartofCourse.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 17.07.2023.
//

import UIKit
import FirebaseAuth

class PartOfCourseVC: UIViewController, CreateAlert {
    internal var courseTitle: String = ""
    private var viewModel: PartofCourseViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PartofCourseViewModel()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PartOfCourceCell.nib(), forCellReuseIdentifier: PartOfCourceCell.identifier)
        viewModel?.filterPartOfCourse(title: courseTitle)
        
    }
    
    @IBAction func logOutBtn(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)// go to firsrt VC in stack
        } catch let signOutError as NSError {
            self.createAlert(from: self, errorText: signOutError.localizedDescription)
        }
        
    }
    
}


//MARK: -   Extension UITableViewDataSource

extension PartOfCourseVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PartOfCourceCell.identifier, for: indexPath) as? PartOfCourceCell,
              let viewModel = viewModel else {
            return UITableViewCell()
        }
        
        viewModel.setCellLabels(forIndexPath: indexPath)
      	cell.setCell(withViewModel: viewModel)
           
        return cell
    }
    
    
}

//MARK: -  Extension UITableViewDelegate

extension PartOfCourseVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: CourseMainPageVC.identifier) as? CourseMainPageVC {
                    guard let indexPath = tableView.indexPathForSelectedRow ,
                          let course = viewModel?.getCurrentCourse(forIndexPath: indexPath) else { return  }
        
            vc.viewModel?.setCourseLabels(for: course)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
}

