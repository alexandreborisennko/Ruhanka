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

let easyLevel = LevelStruct(level: CourseProperties.Level.easy)
let mediumLevel = LevelStruct(level: CourseProperties.Level.medium)
let hardLevel = LevelStruct(level: CourseProperties.Level.hard)

let yogaType = TypeStruct(type: CourseProperties.ProgramType.yoga)
let fitnessType = TypeStruct(type: CourseProperties.ProgramType.fitness)
let grassType = TypeStruct(type: CourseProperties.ProgramType.grass)

let shouldersPart = BodyStruct(bodyPart: CourseProperties.BodyPart.shoulders)
let loinPart = BodyStruct(bodyPart: CourseProperties.BodyPart.loin)
let legsParts = BodyStruct(bodyPart: CourseProperties.BodyPart.legs)



