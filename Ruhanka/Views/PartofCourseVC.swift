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
    private var allPartsOfCourse = myCourseParts
    private var filteredPartsOfCourse: [CoursePart] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CourseCell.nib(), forCellReuseIdentifier: CourseCell.identifier)
        filteredPartsOfCourse = allPartsOfCourse.filter {$0.courseTitle == courseTitle}
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
        return filteredPartsOfCourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseCell.identifier, for: indexPath) as? CourseCell else {
            return UITableViewCell()
        }
        
       /* let model = filteredPartsOfCourse[indexPath.row]
        let viewModel = CourseCellViewModel(courseImage: model.coursePartImage, courseLevel: model.courseLevel, courseType: model.courseType, courseBody: model.courseBody, courseTitle: model.courseTitle, courseAuthor: model.courseAuthor, courseLength: model.courseLength)
        cell.setCell(with: viewModel) */
    // не відображаєтся частина курса зараз - треба окрему вьюмодел?
           
        return cell
    }
    
    
}

//MARK: -  Extension UITableViewDelegate

extension PartOfCourseVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //tells the delegate that the current row is selected
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: CourseMainPageVC.identifier) as? CourseMainPageVC {
            
                if let indexPath = tableView.indexPathForSelectedRow {

                let course = filteredPartsOfCourse[indexPath.row]
                vc.setCourse(for: course)
                
            }
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
}

