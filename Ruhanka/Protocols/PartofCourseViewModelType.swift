//
//  PartofCourseViewModelType.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 06.09.2023.
//

import UIKit

protocol PartofCourseViewModelType {
    var numberOfRows: Int  {get}
    var filteredPartsOfCourse : [CoursePart] {get}

        
    func filterPartOfCourse(title: String)
    func setCellLabels(forIndexPath indexPath: IndexPath)
    func getCurrentCourse(forIndexPath indexPath: IndexPath)  -> CoursePart
}
