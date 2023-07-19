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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


