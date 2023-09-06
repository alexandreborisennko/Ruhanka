//
//  AvailableCoursesViewModel.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 09.08.2023.
//

import UIKit


class AvailableCoursesViewModel: AvailableCoursesViewModelType, CellFieldsModelType {
    
    var backgroundColor: UIColor = .white
    weak var delegate: AvailableCoursesViewModelDelegate?
    
    func changeColor() {
        backgroundColor = .blue
        delegate?.didChangeBackgroundColor(backgroundColor)
    }
    
    
        var numberOfRows: Int {
        return filteredCourses.count
    }
    
  
        var filteredCourses: [Course] = []
        var availableCourses: [Course] {
          return  [AvailableCourses.marafonNog,
                   AvailableCourses.RuhankaBitsepsa.main,
                   AvailableCourses.MarafonNog2.main,
                   AvailableCourses.MarafonPlechey.main,
                   AvailableCourses.RuhankaKopchic.main]
      }
    
    var courseImage : UIImage?
    var courseLevel: String?
    var courseType: String?
    var courseBody: [BodyStruct]?
    var courseTitle : String?
    var courseAuthor: String?
    var courseLength: String?
    
    
    func setDefaultFilterCourses() {
        filteredCourses = availableCourses
    }
    
    
    func filterCourses(courseStructure type: Course.CourseStructure) {
        filteredCourses = availableCourses.filter { $0.courseStructure == type }
        
    }
    
    func setCellLabels(forIndexPath indexPath: IndexPath){
        let course = filteredCourses[indexPath.row]
        courseImage = course.courseImage
        
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
        courseTitle = course.courseTitle
        courseAuthor = course.courseAuthor
        courseLength = "·   \(course.courseLength)"
    
    }
    
    func getCurrentCourse(forIndexPath indexPath: IndexPath)  -> Course{
        return filteredCourses[indexPath.row]
    }

    


}
