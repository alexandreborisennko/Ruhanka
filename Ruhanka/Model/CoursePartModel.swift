//
//  CoursePart.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 17.07.2023.
//

import UIKit



class CoursePart: Course {
    var coursePart: String
    var coursePartImage: UIImage
    var coursePartLength: String
    init(course: Course, coursePart: String, coursePartImage: UIImage, coursePartLength: String) {
        self.coursePart = coursePart
        self.coursePartImage = coursePartImage
        self.coursePartLength = coursePartLength
        
        super.init(courseImage: course.courseImage, courseLevel: course.courseLevel, courseType: course.courseType, courseBody: course.courseBody, courseTitle: course.courseTitle, courseAuthor: course.courseAuthor, courseLength: course.courseLength, courseStructure: course.courseStructure, courseNumber: course.courseNumber)
    }
}

