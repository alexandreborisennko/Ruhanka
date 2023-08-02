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
    var coursePart : String?
    var courseDescription: String?
    var selectedButtonBar: UIView?
    var courseTraining: [CoursePartBlock] = []

    
    @IBOutlet weak var containerTraining: UIView!
    
    
    @IBOutlet weak var topHeaderOutlet: UILabel!
    @IBOutlet weak var mainBottomButton: BottomButton!
    @IBOutlet weak var yogaBottomButton: UIButton!
    @IBOutlet weak var trackerBottomButton: UIButton!
    @IBOutlet weak var herbsBottomButton: UIButton!
    @IBOutlet weak var socialBottomButtom: UIButton!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var topImageHeightConstant: NSLayoutConstraint!
    
    @IBOutlet weak var topLevel: UILabel!
    @IBOutlet weak var topLength: UILabel!
    @IBOutlet weak var topAuthor: UILabel!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var topPartTitle: UILabel!
    @IBOutlet weak var topDescription: UILabel!
    @IBOutlet weak var topType: UILabel!
    
    @IBOutlet weak var hideButtonOutlet: UIButton!
    @IBOutlet weak var topOutlet: UIStackView!
    @IBOutlet weak var trainingOutlet: UIButton!
    @IBOutlet weak var faceCareOutlet: UIButton!
    @IBOutlet weak var favoriteOutlet: UIButton!
    
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
        topPartTitle.text = coursePart
        topDescription.text = courseDescription
        hideButtonOutlet.setTitle("Сховати деталі програми", for: .normal)
        hideButtonOutlet.setImage(UIImage(systemName: "arrow.up"), for: .normal)
        hideButtonOutlet.setTitle("Відкрити деталі програми", for: .selected)
        hideButtonOutlet.setImage(UIImage(systemName: "arrow.down"), for: .selected)
        
        let topHeaderText = "Огляд програми"
        let attributedString = NSMutableAttributedString(string: topHeaderText)
        let range = NSRange(location: 0, length: topHeaderText.count)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        topHeaderOutlet.attributedText = attributedString
        

        selectButton(for: trainingOutlet, deselectButtons: [faceCareOutlet,favoriteOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let childVC = segue.destination as? TrainingTableVC {
                childVC.courseTraining = courseTraining
            }
        }
    
    @IBAction func TrainingButton(_ sender: UIButton) {
        selectButton(for: trainingOutlet, deselectButtons: [faceCareOutlet,favoriteOutlet], selectedButtonBar: &selectedButtonBar)

    }
    
    @IBAction func faceCareButton(_ sender: UIButton) {
        selectButton(for: faceCareOutlet, deselectButtons: [trainingOutlet,favoriteOutlet], selectedButtonBar: &selectedButtonBar)
    }
    @IBAction func favoriteButton(_ sender: UIButton) {
        selectButton(for: favoriteOutlet, deselectButtons: [trainingOutlet,faceCareOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    @IBAction func hideDescription(_ sender: UIButton) {
        if sender.isSelected {
            topOutlet.isHidden = false
            topImageHeightConstant.constant = 250

        } else {
            topOutlet.isHidden = true
            topImageHeightConstant.constant = 0
            view.layoutIfNeeded()
        }
        sender.isSelected = !sender.isSelected

        
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

extension UIViewController {
    
    func chooseMiddleMenuButton(for button: UIButton, deselectButtons: [UIButton], selectedButtonBar:inout UIView?) {
        
    }
    
    

}


