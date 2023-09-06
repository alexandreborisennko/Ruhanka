//
//  AvailableCoursesModelType.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 25.08.2023.
//

import UIKit

protocol AvailableCoursesViewModelType {
    var numberOfRows : Int {get}
    func setCellLabels(forIndexPath indexPath: IndexPath)
    var filteredCourses: [Course] {get}
    func setDefaultFilterCourses()
    func filterCourses(courseStructure type: Course.CourseStructure)
    
    var courseImage : UIImage? {get}
    var courseLevel: String? {get}
    var courseType: String?  {get}
    var courseBody: [BodyStruct]? {get}
    var courseTitle : String? {get}
    var courseAuthor: String? {get}
    var courseLength: String? {get}
    
    func changeColor()
    var backgroundColor: UIColor {get}
    var delegate:  AvailableCoursesViewModelDelegate? {get set}

}
