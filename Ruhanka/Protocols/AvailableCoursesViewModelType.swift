//
//  AvailableCoursesModelType.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 25.08.2023.
//

import UIKit

protocol AvailableCoursesViewModelType {
    var numberOfRows : Int {get}
    var filteredCourses: [Course] {get}
    

    func changeColor()
    func setDefaultFilterCourses()
    func filterCourses(courseStructure type: Course.CourseStructure)
    func setCellLabels(forIndexPath indexPath: IndexPath)
    func getCurrentCourse(forIndexPath indexPath: IndexPath)  -> Course

    
    var backgroundColor: UIColor {get}
    var delegate:  AvailableCoursesViewModelDelegate? {get set}

}
