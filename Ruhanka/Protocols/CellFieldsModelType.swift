//
//  CellFieldsModelType.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 06.09.2023.
//

import UIKit

protocol CellFieldsModelType {
    var courseImage : UIImage? {get}
    var courseLevel: String? {get}
    var courseType: String?  {get}
    var courseBody: [BodyStruct]? {get}
    var courseTitle : String? {get}
    var courseAuthor: String? {get}
    var courseLength: String? {get}
}
