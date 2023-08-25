//
//  AvailableCoursesViewModel.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 09.08.2023.
//

import Foundation



class AvailableCoursesViewModel: AvailableCoursesViewModelType {
    
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
    
    
    func setDefaultFilterCourses() {
        filteredCourses = availableCourses
    }
    
    
    func filterCourses(courseStructure type: Course.CourseStructure) {
        filteredCourses = availableCourses.filter { $0.courseStructure == type }
        
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CourseCellViewModelType? {
        let course = filteredCourses[indexPath.row]
        return CourseCellViewModel(course: course)
    }
}
