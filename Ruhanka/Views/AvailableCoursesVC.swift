//
//  AvailableCoursesVC.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 07.07.2023.
//

import UIKit
import FirebaseAuth

class AvailableCoursesVC: UIViewController, CreateAlert {
    
  private  var selectedButtonBar: UIView? = nil
  private  var filteredCourses: [Course] = []
  private var availableCourses: [Course] {                        //computed variable
        return  [AvailableCourses.marafonNog,
                 AvailableCourses.RuhankaBitsepsa.main,
                 AvailableCourses.MarafonNog2.main,
                 AvailableCourses.MarafonPlechey.main,
                 AvailableCourses.RuhankaKopchic.main]
    }
    
    @IBOutlet weak var menuAllButtonOutlet: UIButton!
    @IBOutlet weak var menuMarafonButtonOutlet: UIButton!
    @IBOutlet weak var menuRuhankaButtonOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var buttonConstaintTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        filteredCourses = availableCourses
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CourseCellVC.nib(), forCellReuseIdentifier: CourseCellVC.identifier)
      
    }
    

    //MARK: -  Top menu Buttons
    

    @IBAction func allButton(_ sender: UIButton) {
        filteredCourses = availableCourses
        tableView.reloadData()
        selectButton(for: menuAllButtonOutlet, deselectButtons: [menuMarafonButtonOutlet,menuRuhankaButtonOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    @IBAction func marafonButton(_ sender: UIButton) {
        filterCourses(courseStructure: .marafon)
        selectButton(for: menuMarafonButtonOutlet,deselectButtons: [menuAllButtonOutlet,menuRuhankaButtonOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    @IBAction func ruhankaButton(_ sender: UIButton) {
        filterCourses(courseStructure: .ruhanka)
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
        return filteredCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseCellVC.identifier, for: indexPath) as? CourseCellVC else {
            return UITableViewCell()
        }
            let model = filteredCourses[indexPath.row]
            let viewModel   = CourseCellViewModel(courseImage: model.courseImage, courseLevel: model.courseLevel, courseType: model.courseType, courseBody: model.courseBody, courseTitle: model.courseTitle, courseAuthor: model.courseAuthor, courseLength: model.courseLength)
            cell.setCell(with: viewModel)
           
        return cell
    }
    

    
    
}

//MARK: -  TableViewDataSource

extension AvailableCoursesVC: UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: PartOfCourseVC.identifier) as? PartOfCourseVC {
            if let indexPath = tableView.indexPathForSelectedRow {
                let courseTitle = filteredCourses[indexPath.row].courseTitle
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
    
    
   private func filterCourses(courseStructure type: Course.CourseStructure) {
        filteredCourses = availableCourses.filter { $0.courseStructure == type }
        tableView.reloadData()
    }
}



