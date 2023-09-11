//
//  CourseMainPageViewModel.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 11.09.2023.
//

import UIKit



class CourseMainPageViewModel: CourseMainPageViewModelType {
    
    weak var delegate: CourseMainViewModelDelegate?
    
    var mainTag: String?
    var mainName: String?
    var mainImage: UIImage?
    
    var numberOfRows: Int = 0
    var courseImage: UIImage?
    var courseTitle: String?
    var courseAuthor: String?
    var courseLength: String?
    var courseLevel: String?
    var courseType: String?
    var coursePart: String?
    var courseDescription: String?
    var courseTrainings: [CoursePartBlock] = []
    var courseFaceCares: [CoursePartBlock] = []
    
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
        courseTrainings = course.courseTrainings
        courseFaceCares = course.courseFaceCares
        
    }
    
    func getNumberOfRows(selectedButton: Int) {
   
        if selectedButton == 1 {
            numberOfRows = courseTrainings.count
        }
        if selectedButton == 2 {
            numberOfRows = courseFaceCares.count
        }
    }
    
    func setCellLabels(forIndexPath indexPath: IndexPath) {
        
        if delegate?.whatTableToShow  == 1
        {
            mainTag = courseTrainings[indexPath.row].blockTag
            mainName = courseTrainings[indexPath.row].blockName
            mainImage = courseTrainings[indexPath.row].blockImage
        }
        
        if delegate?.whatTableToShow  == 2
        {
            mainTag = courseFaceCares[indexPath.row].blockTag
            mainName = courseFaceCares[indexPath.row].blockName
            mainImage = courseFaceCares[indexPath.row].blockImage
        }
    }
   
}
