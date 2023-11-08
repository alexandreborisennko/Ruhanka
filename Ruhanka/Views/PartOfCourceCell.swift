//
//  CourseCell2.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 30.10.2023.
//

import UIKit

class PartOfCourceCell: UITableViewCell {
    @IBOutlet weak var courseType: UILabel!
    @IBOutlet weak var courseLevel: UILabel!
    @IBOutlet weak var courseMainImage: UIImageView!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseLength: UILabel!
    @IBOutlet weak var courseAuthor: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK: -  SetCell

extension PartOfCourceCell {
    
    static func nib() -> UINib{
        return UINib(nibName: "PartOfCourceCell", bundle: nil)
    }
    
    public func setCell (withViewModel viewModel:  CellFieldsModelType) {
             
        courseTitle.text = viewModel.courseTitle
        courseMainImage.image = viewModel.courseImage
        courseAuthor.text = viewModel.courseAuthor
        courseLevel.text = viewModel.courseLevel
        courseType.text = viewModel.courseType
        courseLength.text = viewModel.courseLength
        courseMainImage.makeRoundCorners(byRadius: 20)
        
    }
        
}
