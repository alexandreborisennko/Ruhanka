//
//  CourseCell.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 12.07.2023.
//

import UIKit

class CourseCellVC: UITableViewCell {
    
    @IBOutlet weak var courseType: UILabel!
    @IBOutlet weak var courseLevel: UILabel!
    @IBOutlet weak var courseMainImage: UIImageView!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseLength: UILabel!
    @IBOutlet weak var courseAuthor: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}

//MARK: -  SetCell

extension CourseCellVC {
    
    static func nib() -> UINib{
        return UINib(nibName: "CourseCell", bundle: nil)
    }
    
    public func setCell(with viewModel: CourseCellViewModel) {
        
       /* if let coursePart =  course as? CoursePart { //
            courseTitle.text = "\(coursePart.courseTitle).   \(coursePart.coursePart)"
            courseMainImage.image = coursePart.coursePartImage */
            
        
        courseTitle.text = viewModel.courseTitle
        courseMainImage.image = viewModel.courseImage
        courseAuthor.text = viewModel.courseAuthor
        
        courseLevel.text = ""
        for (index,element) in viewModel.courseLevel.enumerated() {
            courseLevel.text! += "\(element.level) "
            if index+1 < viewModel.courseLevel.count {
                courseLevel.text! += "/ "
            } else {
                courseLevel.text! += "  "
            }
        }
        courseType.text = ""
        for (index, element) in viewModel.courseType.enumerated() {
            courseType.text! += "\(element.type)  "
            if index+1 < viewModel.courseType.count {
                courseType.text! += "·  "
            }
        }
        courseLength.text = "·   \(viewModel.courseLength)"
        courseMainImage.makeRoundCorners(byRadius: 20)
        
    }
}


