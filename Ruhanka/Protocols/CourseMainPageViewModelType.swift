//
//  CourseMainPageViewModelType.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 11.09.2023.
//

import UIKit

protocol CourseMainPageViewModelType {
    
    var courseTraining: [CoursePartBlock]  {get}
    var courseImage : UIImage? {get}
    var courseTitle: String? {get}
    var courseAuthor: String? {get}
    var courseLength: String? {get}
    var courseLevel: String? {get}
    var courseType: String? {get}
    var coursePart : String? {get}
    var courseDescription: String? {get}
    
    func setCourseLabels(for course: CoursePart)
}
