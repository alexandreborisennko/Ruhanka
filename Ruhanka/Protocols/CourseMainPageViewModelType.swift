//
//  CourseMainPageViewModelType.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 11.09.2023.
//

import UIKit

protocol CourseMainPageViewModelType {
    
    var delegate: CourseMainViewModelDelegate? {get set}
    var courseTrainings: [CoursePartBlock]  {get}
    var courseFaceCares: [CoursePartBlock]  {get}
    var numberOfRows: Int {get}
    
    var courseImage : UIImage? {get}
    var courseTitle: String? {get}
    var courseAuthor: String? {get}
    var courseLength: String? {get}
    var courseLevel: String? {get}
    var courseType: String? {get}
    var coursePart : String? {get}
    var courseDescription: String? {get}
    
    
    var mainTag: String? {get}
    var mainName : String? {get}
    var mainImage: UIImage? {get}
    
    func setCourseLabels(for course: CoursePart)
    func getNumberOfRows(selectedButton: Int)
    func setCellLabels(forIndexPath indexPath: IndexPath)
}
