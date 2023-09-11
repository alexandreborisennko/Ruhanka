//
//  CourseMainPageViewModel.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 11.09.2023.
//

import UIKit

class CourseMainPageViewModel: CourseMainPageViewModelType {
    var courseImage: UIImage?
    var courseTitle: String?
    var courseAuthor: String?
    var courseLength: String?
    var courseLevel: String?
    var courseType: String?
    var coursePart: String?
    var courseDescription: String?
    var courseTraining: [CoursePartBlock] = []
    
    func setCourseLabels(for course: CoursePart) {
        courseImage = course.coursePartImage
        courseTitle = "\(course.courseTitle)."
        coursePart = course.coursePart
        courseAuthor = course.courseAuthor
        courseLength   = "·   \(course.coursePartLength)"
        courseLevel = ""
        for (index,element) in course.courseLevel.enumerated() {
            courseLevel! += "\(element.level) "
            if index+1 < course.courseLevel.count {
                courseLevel! += "/ "
            } else {
                courseLevel! += "  "
            }
        }
       
        courseType = ""
        for (index, element) in course.courseType.enumerated() {
            courseType! += "\(element.type)  "
            if index+1 < course.courseType.count {
                courseType! += "·  "
            }
        }
      
        courseDescription = course.coursePartDescription
        courseTraining = course.courseTrainings
    }
   
}
