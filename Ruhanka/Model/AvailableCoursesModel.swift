//
//  Course.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 12.07.2023.
//

import UIKit

struct Course {
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




