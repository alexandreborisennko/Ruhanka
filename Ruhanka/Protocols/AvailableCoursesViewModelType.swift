//
//  AvailableCoursesModelType.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 25.08.2023.
//

import Foundation

protocol AvailableCoursesViewModelType {
    var numberOfRows : Int {get}
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CourseCellViewModelType?
    var filteredCourses: [Course] {get}
    func setDefaultFilterCourses()
    func filterCourses(courseStructure type: Course.CourseStructure)
}
