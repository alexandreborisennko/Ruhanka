//
//  PartofCourseViewModel.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 06.09.2023.
//

import UIKit

class PartofCourseViewModel: PartofCourseViewModelType,CellFieldsModelType {
    
    var allPartsOfCourse = myCourseParts
    var filteredPartsOfCourse: [CoursePart] = []
    
    var courseImage: UIImage?
    var courseLevel: String?
    var courseType: String?
    var courseBody: [BodyStruct]?
    var courseTitle: String?
    var courseAuthor: String?
    var courseLength: String?
    
    var numberOfRows: Int {
        return filteredPartsOfCourse.count
    }
    
    
    func filterPartOfCourse(title: String) {
        filteredPartsOfCourse = allPartsOfCourse.filter {$0.courseTitle == title}
    }
    
    func setCellLabels(forIndexPath indexPath: IndexPath) {
        let  course = filteredPartsOfCourse[indexPath.row]
        
        courseTitle = "\(course.courseTitle).   \(course.coursePart)"
        courseImage  = course.coursePartImage
        
        var  level: String = ""
        for (index,element) in course.courseLevel.enumerated() {
            level += "\(element.level) "
            if index+1 < course.courseLevel.count {
                level += "/ "
            } else {
                level += "  "
            }
        }
        courseLevel = level
        
        var type: String = ""
        for (index, element) in course.courseType.enumerated() {
            type += "\(element.type)  "
            if index+1 < course.courseType.count {
               type += "·  "
            }
        }
        courseType = type
        
        courseBody = course.courseBody
        courseAuthor = course.courseAuthor
        courseLength = "·   \(course.courseLength)"
        
    }
    
    func getCurrentCourse(forIndexPath indexPath: IndexPath) -> CoursePart {
        return filteredPartsOfCourse[indexPath.row]
    }
        
    
}
