//
//  CourseCellViewModelType.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 25.08.2023.
//

import UIKit
protocol CourseCellViewModelType {
    var courseImage : UIImage {get}
    var courseLevel: String {get}
    var courseType: String  {get}
    var courseBody: [BodyStruct] {get}
    var courseTitle : String {get}
    var courseAuthor: String {get}
    var courseLength: String {get}
    
}
