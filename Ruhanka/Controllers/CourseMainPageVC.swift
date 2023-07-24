//
//  CourseMainPage.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 19.07.2023.
//

import UIKit


class CourseMainPageVC: UIViewController {
    var courseImage : UIImage?
    var courseTitle: String?
    var courseAuthor: String?
    var courseLength: String?
    var courseLevel: String?
    var courseType: String?
    var courseDescription: String?
    var selectedButtonBar: UIView?
    
    
    @IBOutlet weak var mainBottomButton: BottomButton!
    @IBOutlet weak var yogaBottomButton: UIButton!
    @IBOutlet weak var trackerBottomButton: UIButton!
    @IBOutlet weak var herbsBottomButton: UIButton!
    @IBOutlet weak var socialBottomButtom: UIButton!
    @IBOutlet weak var topImage: UIImageView!
  
    @IBOutlet weak var topLevel: UILabel!
    @IBOutlet weak var topLength: UILabel!
    @IBOutlet weak var topAuthor: UILabel!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var topDescription: UILabel!
    @IBOutlet weak var topType: UILabel!
    
    @IBOutlet weak var trainingOutlet: UIButton!
    @IBOutlet weak var facialOutlet: UIButton!
    @IBOutlet weak var favoriteOutlet: UIButton!
    @IBOutlet weak var testOutlet: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainBottomButton.setImage(#imageLiteral(resourceName: "homePressed"), for: .selected)
        yogaBottomButton.setImage(#imageLiteral(resourceName: "yogaPressed"), for: .selected)
        trackerBottomButton.setImage(#imageLiteral(resourceName: "trackerPressed"), for: .selected)
        herbsBottomButton.setImage(#imageLiteral(resourceName: "herbsPressed"), for: .selected)
        socialBottomButtom.setImage(#imageLiteral(resourceName: "socialPressed"), for: .selected)
                
        mainBottomButton.setImage(#imageLiteral(resourceName: "home"), for: .disabled)
        yogaBottomButton.setImage(#imageLiteral(resourceName: "yoga"), for: .disabled)
        trackerBottomButton.setImage(#imageLiteral(resourceName: "tracker"), for: .disabled)
        herbsBottomButton.setImage(#imageLiteral(resourceName: "herbs"), for: .normal)
        socialBottomButtom.setImage(#imageLiteral(resourceName: "social"), for: .normal)
        
        topImage.image = courseImage
        topTitle.text = courseTitle
        topAuthor.text = courseAuthor
        topLength.text = courseLength
        topLevel.text = courseLevel
        topType.text = courseType
        topDescription.text = courseDescription

        selectButton(for: trainingOutlet, deselectButtons: [facialOutlet,favoriteOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    @IBAction func TrainingButton(_ sender: UIButton) {
        selectButton(for: trainingOutlet, deselectButtons: [facialOutlet,favoriteOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    @IBAction func facialButton(_ sender: UIButton) {
        selectButton(for: facialOutlet, deselectButtons: [trainingOutlet,favoriteOutlet], selectedButtonBar: &selectedButtonBar)
    }
    @IBAction func favoriteButton(_ sender: UIButton) {
        selectButton(for: favoriteOutlet, deselectButtons: [trainingOutlet,facialOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    @IBAction func hideDescription(_ sender: UIButton) {
        testOutlet.isHidden = true
    }
    
    @IBAction func mainBottomButtonPressed(_ sender: BottomButton) {
     
        sender.isSelected = true
        
    }
    
    @IBAction func yogaBottomButtonPressed(_ sender: UIButton) {
        sender.isSelected = true
    }
    
    @IBAction func trackerBottomButtonPressed(_ sender: UIButton) {
        sender.isSelected = true
    }
    @IBAction func herbsBottomButtonPressed(_ sender: UIButton) {
        sender.isSelected = true

    }
    @IBAction func socialBottomPressed(_ sender: UIButton) {
        sender.isSelected = true
    }
}


class BottomButton: UIButton  {
     override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ?  UIColor.white : UIColor.white
        }
    }
}


