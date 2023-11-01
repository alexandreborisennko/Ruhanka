//
//  CourseCell2.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 30.10.2023.
//

import UIKit

class PartOfCourceCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CourseCell2", bundle: nil)
    }
    
}
