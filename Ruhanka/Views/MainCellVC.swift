//
//  MainCell.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 25.07.2023.
//

import UIKit

class MainCellVC: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainName: UILabel!
    @IBOutlet weak var mainTag: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MainCellVC {
    static func nib() -> UINib {
        return UINib(nibName: "MainCell", bundle: nil)
    }
}
