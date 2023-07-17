//
//  Constants.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 12.07.2023.
//

import UIKit

    
    struct CourseProperties {
        struct Level {
            static let easy = "ПОЧАТКІВЕЦЬ"
            static let medium = "ВПЕВНЕНИЙ"
            static let hard = "ДОСВІДЧЕНИЙ"
        }
        struct ProgramType {
            static let yoga = "ЙОГА"
            static let fitness = "ТРЕНУВАННЯ"
            static let grass = "ТРАВИ"
        }
        struct BodyPart {
            static let  shoulders = "ПЛЕЧІ"
            static let  loin = "ПОПЕРЕК"
            static let  legs = "НОГИ"
        }
    
    }

let easyLevel = LevelStruct(level: CourseProperties.Level.easy)
let mediumLevel = LevelStruct(level: CourseProperties.Level.medium)
let hardLevel = LevelStruct(level: CourseProperties.Level.hard)

let yogaType = TypeStruct(type: CourseProperties.ProgramType.yoga)
let fitnessType = TypeStruct(type: CourseProperties.ProgramType.fitness)
let grassType = TypeStruct(type: CourseProperties.ProgramType.grass)

let shouldersPart = BodyStruct(bodyPart: CourseProperties.BodyPart.shoulders)
let loinPart = BodyStruct(bodyPart: CourseProperties.BodyPart.loin)
let legsParts = BodyStruct(bodyPart: CourseProperties.BodyPart.legs)



let myCourseParts =  [
    CoursePart(course: AvailableCourses.marafonNog, coursePart: "Частина 1 ", coursePartImage: #imageLiteral(resourceName: "course1_1"), coursePartLength: "10 днів"),
     CoursePart(course: AvailableCourses.marafonNog, coursePart: "Частина 2", coursePartImage: #imageLiteral(resourceName: "course1_2"), coursePartLength: "12 днів"),
    CoursePart(course: AvailableCourses.MarafonPlechey.main, coursePart: "Частина 2", coursePartImage: #imageLiteral(resourceName: "course1_2"), coursePartLength: "12 днів")
    
]

struct AvailableCourses {
            
        static let marafonNog = Course(
            courseImage: #imageLiteral(resourceName: "course1"),
            courseLevel: [easyLevel,mediumLevel],
            courseType: [yogaType,grassType],
            courseBody: [shouldersPart],
            courseTitle: "Марафон Ніг",
            courseAuthor: "Даша Харченко",
            courseLength: "20 дней",
            courseStructure: .marafon,
            courseNumber: 0
        )
        
    struct  RuhankaBitsepsa {
        
        static let main = Course(
            courseImage: #imageLiteral(resourceName: "course2"),
            courseLevel: [hardLevel],
            courseType: [fitnessType],
            courseBody: [shouldersPart],
            courseTitle: "Руханка біцепса",
            courseAuthor: "Даша Харченко",
            courseLength: "10 дней",
            courseStructure: .ruhanka, courseNumber: 1
        )
    }
    
    struct MarafonNog2 {
        static let main = Course(
            courseImage: #imageLiteral(resourceName: "course4"),
            courseLevel: [easyLevel,mediumLevel],
            courseType: [yogaType],
            courseBody: [shouldersPart],
            courseTitle: "Марафон Ніг",
            courseAuthor: "Dasha Harchenko",
            courseLength: "20 дней",
            courseStructure: .marafon, courseNumber: 2
        )
    }
    
    
    struct MarafonPlechey {
        static let main = Course(
            courseImage: #imageLiteral(resourceName: "course3"),
            courseLevel: [easyLevel],
            courseType: [yogaType],
            courseBody: [shouldersPart],
            courseTitle: "Марафон Плечей",
            courseAuthor: "Ангеліна Кримська",
            courseLength: "15 дней",
            courseStructure: .marafon, courseNumber: 3
        )
    }
    
    struct RuhankaKopchic {
        static let main = Course(
            courseImage: #imageLiteral(resourceName: "course5"),
            courseLevel: [easyLevel,mediumLevel],
            courseType: [fitnessType],
            courseBody: [shouldersPart],
            courseTitle: "Руханка Кобчіка",
            courseAuthor: "Анлегіна Кримська",
            courseLength: "20 дней",
            courseStructure: .ruhanka, courseNumber: 4
        )
    }
}
