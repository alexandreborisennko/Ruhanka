//
//  PartofCourse.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 17.07.2023.
//

import UIKit
import FirebaseAuth

class PartOfCourse: UIViewController {
    var courseTitle: String = ""
    var allPartsOfCourse = myCourseParts
    var filteredPartsOfCourse: [CoursePart] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.reusableCell)
        filteredPartsOfCourse = allPartsOfCourse.filter {$0.courseTitle == courseTitle}
    }
    
}

//filteredPartsOfCourse = partsOfCourse.filter {$0.courseNumber ==  filteredCourses[indexPath.row].courseNumber }

extension PartOfCourse: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPartsOfCourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.reusableCell, for: indexPath) as! CourseCell //create reusable cell with all properties of custom cell
      
        cell.courseTitle.text = "\(filteredPartsOfCourse[indexPath.row].courseTitle).   \(filteredPartsOfCourse[indexPath.row].coursePart)"
        cell.courseMainImage.image = filteredPartsOfCourse[indexPath.row].coursePartImage
            cell.courseAuthor.text = filteredPartsOfCourse[indexPath.row].courseAuthor
            cell.courseLevel.text = ""
            for (index,element) in filteredPartsOfCourse[indexPath.row].courseLevel.enumerated() {
                cell.courseLevel.text! += "\(element.level) "
                if index+1 < filteredPartsOfCourse[indexPath.row].courseLevel.count {
                    cell.courseLevel.text! += "/ "
                } else {
                    cell.courseLevel.text! += "  "
                }
            }
            
            cell.courseType.text = ""
            for (index, element) in filteredPartsOfCourse[indexPath.row].courseType.enumerated() {
                cell.courseType.text! += "\(element.type)  "
                if index+1 < filteredPartsOfCourse[indexPath.row].courseType.count {
                    cell.courseType.text! += "·  "
                }
            }
            cell.courseLength.text = "·   \(filteredPartsOfCourse[indexPath.row].coursePartLength)"
            cell.courseMainImage.makeRoundCorners(byRadius: 20)
           
        return cell
    }
    
    
}

extension PartOfCourse: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //tells the delegate that the current row is selected
        print("DJIGYRDA")
       //self.performSegue(withIdentifier: K.Segues.availableCoursesToPartCourse, sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == K.Segues.availableCoursesToPartCourse {
//            if let destinationVC = segue.destination as? PartOfCourse {
//                if let indexPath = tableView.indexPathForSelectedRow {
//                    let courseTitle = filteredPartsOfCourse[indexPath.row].courseTitle
//                    destinationVC.courseTitle = courseTitle
//                }
//            }
//        }
//    }

}

