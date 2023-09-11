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
/* test course trainings */
let marafonNog1PartTrainging1  = CoursePartBlock(blockImage: UIImage(named: "training1")!, blockTag: "Розтяжка", blockName: "Тренування №1")
let marafonNog1PartTrainging2  = CoursePartBlock(blockImage: UIImage(named: "training2")!, blockTag: "Спина", blockName: "Тренування №2")
let marafonNog1PartTrainging3  = CoursePartBlock(blockImage: UIImage(named: "training3")!, blockTag: "Прес та сідниця", blockName: "Тренування №3")
let marafonNog1PartTrainging4  = CoursePartBlock(blockImage: UIImage(named: "training4")!, blockTag: "Голова та руки", blockName: "Тренування №4")
let marafonNog1PartTrainging5  = CoursePartBlock(blockImage: UIImage(named: "training5")!, blockTag: "Плечі", blockName: "Тренування №5")
let marafonNog1PartTrainging6  = CoursePartBlock(blockImage: UIImage(named: "training6")!, blockTag: "Ноги", blockName: "Тренування №6")



/* test course face cares */

let marafonNog1PartFaceCare1 = CoursePartBlock(blockImage: UIImage(named: "facecare1")!, blockTag: "Антізморшки", blockName: "Тренування №1")
let marafonNog1PartFaceCare2 = CoursePartBlock(blockImage: UIImage(named: "facecare2")!, blockTag: "Боротьба з вугрями", blockName: "Тренування №2")
let marafonNog1PartFaceCare3 = CoursePartBlock(blockImage: UIImage(named: "facecare3")!, blockTag: "Масаж щок", blockName: "Тренування №3")
let marafonNog1PartFaceCare4 = CoursePartBlock(blockImage: UIImage(named: "facecare4")!, blockTag: "Збільшуем розріз очей", blockName: "Тренування №4")




let myCourseParts =  [
    CoursePart(course: AvailableCourses.marafonNog, coursePart: "Частина 1 ", coursePartImage: #imageLiteral(resourceName: "course1_1"), coursePartLength: "10 днів", coursePartDescriprtion: """
               В цьому курсі вас чекає треннування пресу та сідниці. На все про все вам дається 10 днів.
               
               Для тренування потрібні будуть мячик, валік та ремін від халату. Також ви пройдете курс лікування травами, а бонусом отримаєте нове гарне обличчя абсолютно без зусіль. Тож почнемо!
               """, courseTrainings: [marafonNog1PartTrainging1,marafonNog1PartTrainging2,marafonNog1PartTrainging3,marafonNog1PartTrainging4,marafonNog1PartTrainging5,marafonNog1PartTrainging6],
              courseFaceCares: [marafonNog1PartFaceCare1,marafonNog1PartFaceCare2,marafonNog1PartFaceCare3,marafonNog1PartFaceCare4]),
    
    CoursePart(course: AvailableCourses.marafonNog, coursePart: "Частина 2", coursePartImage: #imageLiteral(resourceName: "course1_2"), coursePartLength: "12 днів",  coursePartDescriprtion: "В цьому курсі вас чекає треннування пресу та сідниці. На все про все вам дається 10 днів. Для тренування потрібні будуть мячик, валік та ремін від халату. Також ви пройдете курс лікування травами, а бонусом отримаєте нове гарне обличчя абсолютно без зусіль. Тож почнемо!", courseTrainings: [marafonNog1PartTrainging1,marafonNog1PartTrainging2,marafonNog1PartTrainging3],
              courseFaceCares: [marafonNog1PartFaceCare1,marafonNog1PartFaceCare2,marafonNog1PartFaceCare3,marafonNog1PartFaceCare4]),
    
    CoursePart(course: AvailableCourses.MarafonPlechey.main, coursePart: "Частина 2", coursePartImage: #imageLiteral(resourceName: "course1_2"), coursePartLength: "12 днів",  coursePartDescriprtion: "В цьому курсі вас чекає треннування пресу та сідниці. На все про все вам дається 10 днів. Для тренування потрібні будуть мячик, валік та ремін від халату. Також ви пройдете курс лікування травами, а бонусом отримаєте нове гарне обличчя абсолютно без зусіль. Тож почнемо!", courseTrainings: [marafonNog1PartTrainging1,marafonNog1PartTrainging2,marafonNog1PartTrainging3],
               courseFaceCares: [marafonNog1PartFaceCare1,marafonNog1PartFaceCare2,marafonNog1PartFaceCare3,marafonNog1PartFaceCare4])
    
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
