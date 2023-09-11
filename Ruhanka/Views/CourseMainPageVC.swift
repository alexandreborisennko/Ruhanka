//
//  CourseMainPage.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 19.07.2023.
//

import UIKit


protocol CourseMainViewModelDelegate: AnyObject {
    var whatTableToShow : Int {get set}
}

class CourseMainPageVC: UIViewController, CourseMainViewModelDelegate {

    var selectedButtonBar: UIView?
    var viewModel: CourseMainPageViewModelType? = CourseMainPageViewModel()
    var whatTableToShow: Int = 1
        
    @IBOutlet weak var containerTraining: UIView!
    @IBOutlet weak var tableView: UITableView!
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
        setUI()
        setCourse()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainCell.nib(), forCellReuseIdentifier: MainCell.identifier)
        viewModel?.delegate = self
        viewModel?.getNumberOfRows(selectedButton: whatTableToShow)

        
    }
    
    
    @IBAction func trainingButton(_ sender: UIButton) {
        selectButton(for: trainingOutlet, deselectButtons: [faceCareOutlet,favoriteOutlet], selectedButtonBar: &selectedButtonBar)
        whatTableToShow = 1 
        viewModel?.getNumberOfRows(selectedButton: whatTableToShow)
        tableView.reloadData()

    }
    
    @IBAction func faceCareButton(_ sender: UIButton) {
        selectButton(for: faceCareOutlet, deselectButtons: [trainingOutlet,favoriteOutlet], selectedButtonBar: &selectedButtonBar)
        whatTableToShow = 2
        viewModel?.getNumberOfRows(selectedButton: whatTableToShow)
        tableView.reloadData()

    }
    @IBAction func favoriteButton(_ sender: UIButton) {
        selectButton(for: favoriteOutlet, deselectButtons: [trainingOutlet,faceCareOutlet], selectedButtonBar: &selectedButtonBar)
        whatTableToShow = 3
        viewModel?.getNumberOfRows(selectedButton: whatTableToShow)
        tableView.reloadData()

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




extension CourseMainPageVC {
    
    //MARK: -  SetUI

    private func setUI(){
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
    
    
    //MARK: -  setCourse

    private func setCourse() {
        topTitle.text = viewModel?.courseTitle
        topImage.image = viewModel?.courseImage
        topPartTitle.text = viewModel?.coursePart
        topDescription.text = viewModel?.courseDescription
        topAuthor.text = viewModel?.courseAuthor
        topLength.text = viewModel?.courseLength
        topLevel.text = viewModel?.courseLevel
        topType.text = viewModel?.courseType
    }
}

extension CourseMainPageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier, for: indexPath) as? MainCell, let viewModel = viewModel   else {return UITableViewCell()}
        
        viewModel.setCellLabels(forIndexPath: indexPath)
        cell.setCell(withViewModel: viewModel)
        return cell
    }
}



extension CourseMainPageVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


