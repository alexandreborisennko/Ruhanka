//
//  CourceCellViewModel.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 09.08.2023.
//

import UIKit

class CourseCellViewModel: CourseCellViewModelType {


    
    private var  course : Course
    
    var courseImage : UIImage {
        return course.courseImage
    }
    
    var courseLevel: String   {
        var  level: String = ""
        for (index,element) in course.courseLevel.enumerated() {
            level += "\(element.level) "
            if index+1 < course.courseLevel.count {
                level += "/ "
            } else {
                level += "  "
            }
        }
        return level
    }


    
    var courseType: String {
        var type: String = ""
        for (index, element) in course.courseType.enumerated() {
            type += "\(element.type)  "
            if index+1 < course.courseType.count {
               type += "·  "
            }
        }
        return type
    }
    var courseBody: [BodyStruct] {
        return course.courseBody
    }
    
    var courseTitle : String {
        return course.courseTitle
    }
    
    var courseAuthor: String {
        return course.courseAuthor
    }
    
    var courseLength: String {
     
        return "·   \(course.courseLength)"
    }
    
    init(course: Course) {
        self.course = course
    }
    
}
