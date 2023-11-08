//
//  AvailableCoursesVC.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 07.07.2023.
//

import UIKit
import FirebaseAuth

protocol AvailableCoursesViewModelDelegate: AnyObject {
    func didChangeBackgroundColor(_ color: UIColor)
}

class AvailableCoursesVC: UIViewController, CreateAlert, AvailableCoursesViewModelDelegate  {
    
    private var viewModel : AvailableCoursesViewModel?
    private  var selectedButtonBar: UIView? = nil
    
    @IBOutlet var myView: UIView!
    @IBOutlet weak var menuAllButtonOutlet: UIButton!
    @IBOutlet weak var menuMarafonButtonOutlet: UIButton!
    @IBOutlet weak var menuRuhankaButtonOutlet: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var buttonConstaintTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AvailableCoursesViewModel()
        setUI()
        setCollectionView()
        viewModel?.setDefaultFilterCourses()

        
        
        myView.backgroundColor = viewModel?.backgroundColor
        viewModel?.delegate = self
    }
    

    //MARK: -  Top menu Buttons
    
    @IBAction func allButton(_ sender: UIButton) {
        viewModel?.setDefaultFilterCourses()
        collectionView.reloadData()
        selectButton(for: menuAllButtonOutlet, deselectButtons: [menuMarafonButtonOutlet,menuRuhankaButtonOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    @IBAction func marafonButton(_ sender: UIButton) {
        viewModel?.filterCourses(courseStructure: .marafon)
        collectionView.reloadData()
        selectButton(for: menuMarafonButtonOutlet,deselectButtons: [menuAllButtonOutlet,menuRuhankaButtonOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    @IBAction func ruhankaButton(_ sender: UIButton) {
        viewModel?.filterCourses(courseStructure: .ruhanka)
        collectionView.reloadData()
        selectButton(for: menuRuhankaButtonOutlet,deselectButtons: [menuAllButtonOutlet,menuMarafonButtonOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    @IBAction func logOutBtn(_ sender: UIBarButtonItem) {
        logOut()

    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        viewModel?.changeColor()
    }
    
    func didChangeBackgroundColor(_ color: UIColor) {
        myView.backgroundColor = color
    }
    
}

//MARK: -  CollectionViewDataSource

extension AvailableCoursesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AvailableCoursesCell.identifier, for: indexPath) as? AvailableCoursesCell,
              let viewModel = viewModel else {
            return UICollectionViewCell()
        }
        viewModel.setCellLabels(forIndexPath: indexPath)
        cell.setCell(withViewModel: viewModel)
        return cell
    }
}

//MARK: -  CollectionViewDataSource

extension AvailableCoursesVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: PartOfCourseVC.identifier) as? PartOfCourseVC {
                guard let viewModel = viewModel  else { return  }
                let courseTitle = viewModel.getCurrentCourse(forIndexPath: indexPath).courseTitle
                vc.courseTitle = courseTitle
                self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
//MARK: -  UICollectionViewDelegateFlowLayout

extension AvailableCoursesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 350)
    }
    
}

extension AvailableCoursesVC {

    //MARK: -   SetUI
   private func setUI() {
        navigationItem.setHidesBackButton(true, animated: true) // hides back button
        selectButton(for: menuAllButtonOutlet,deselectButtons: [menuMarafonButtonOutlet,menuRuhankaButtonOutlet], selectedButtonBar: &selectedButtonBar)
    }
    
    //MARK: -  logOut
    private func logOut() {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)// go to firsrt VC in stack
        } catch let signOutError as NSError {
            self.createAlert(from: self, errorText: signOutError.localizedDescription)
        }
    }
    
    //MARK: -  setCollectionView
    private func setCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AvailableCoursesCell.nib(), forCellWithReuseIdentifier: AvailableCoursesCell.identifier)
    }
    
}



