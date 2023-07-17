//
//  Course.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 12.07.2023.
//

import UIKit

class Course {
    var courseImage : UIImage
    var courseLevel: [LevelStruct]
    var courseType: [TypeStruct]
    var courseBody: [BodyStruct]
    var courseTitle : String
    var courseAuthor: String
    var courseLength: String
    enum CourseStructure {
        case marafon
        case ruhanka
    }
    var courseStructure: CourseStructure
    var courseNumber: Int
    
    init(courseImage: UIImage, courseLevel: [LevelStruct], courseType: [TypeStruct], courseBody: [BodyStruct], courseTitle: String, courseAuthor: String, courseLength: String, courseStructure: CourseStructure, courseNumber: Int) {
        self.courseImage = courseImage
        self.courseLevel = courseLevel
        self.courseType = courseType
        self.courseBody = courseBody
        self.courseTitle = courseTitle
        self.courseAuthor = courseAuthor
        self.courseLength = courseLength
        self.courseStructure = courseStructure
        self.courseNumber = courseNumber
    }
}



struct LevelStruct {
    var level: String
}

struct TypeStruct {
    var type: String
}

struct BodyStruct {
    var bodyPart: String
}




