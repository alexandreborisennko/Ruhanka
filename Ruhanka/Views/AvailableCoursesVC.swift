//
//  AvailableCoursesVC.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 07.07.2023.
//

import UIKit
import FirebaseAuth

class AvailableCoursesVC: UIViewController, CreateAlert {
    
    var viewModel : AvailableCoursesViewModelType?
    private  var selectedButtonBar: UIView? = nil
    
    @IBOutlet weak var menuAllButtonOutlet: UIButton!
    @IBOutlet weak var menuMarafonButtonOutlet: UIButton!
    @IBOutlet weak var menuRuhankaButtonOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var buttonConstaintTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AvailableCoursesViewModel()
        setUI()
        viewModel?.setDefaultFilterCourses()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CourseCell.nib(), forCellReuseIdentifier: CourseCell.identifier)
    }
    

    //MARK: -  Top menu Buttons
    

    @IBAction func allButton(_ sender: UIButton) {
        viewModel?.setDefaultFilterCourses()
        tableView.reloadData()
        selectButton(for: menuAllButtonOutlet, deselectButtons: [menuMarafonButtonOutlet,menuRuhankaButtonOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    @IBAction func marafonButton(_ sender: UIButton) {
        viewModel?.filterCourses(courseStructure: .marafon)
       
        selectButton(for: menuMarafonButtonOutlet,deselectButtons: [menuAllButtonOutlet,menuRuhankaButtonOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    @IBAction func ruhankaButton(_ sender: UIButton) {
        viewModel?.filterCourses(courseStructure: .ruhanka)
        tableView.reloadData()
        selectButton(for: menuRuhankaButtonOutlet,deselectButtons: [menuAllButtonOutlet,menuMarafonButtonOutlet], selectedButtonBar: &selectedButtonBar)
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



//MARK: -  TableViewDataSource

extension AvailableCoursesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseCell.identifier, for: indexPath) as? CourseCell,
              let viewModel = viewModel else {
            return UITableViewCell()
        }
        
        guard let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath) else { return UITableViewCell() }
        
        cell.setCell(withViewModel: cellViewModel)
           
        return cell
    }
    

    
    
}

//MARK: -  TableViewDataSource

extension AvailableCoursesVC: UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: PartOfCourseVC.identifier) as? PartOfCourseVC {
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let viewModel = viewModel, let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath) else { return  }
                let courseTitle =  cellViewModel.courseTitle
                vc.courseTitle = courseTitle
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}


//MARK: -   SetUI

extension AvailableCoursesVC {
    
   private func setUI() {
        navigationItem.setHidesBackButton(true, animated: true) // hides back button
        selectButton(for: menuAllButtonOutlet,deselectButtons: [menuMarafonButtonOutlet,menuRuhankaButtonOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    

}



