//
//  ExtensionFile.swift
//  Ruhanka
//
//  Created by Oleksandr Borysenko on 02.08.2023.
//

import UIKit


//MARK: -   UICollectionViewCell

extension UICollectionViewCell {
    static var identifier: String {
        String(describing: Self.self)
    }
}

//MARK: -  UITableViewCell

extension UITableViewCell {
    static  var identifier: String {
        String(describing: Self.self)
    }
}

//MARK: -  UIViewController

extension UIViewController {
    static var identifier: String {
        String(describing: Self.self)
    }
    
    
    //MARK: -  makeRoundCornersForTextOutlet

   public func makeRoundCornersForTextOutlet(for textFields: UITextField...) { //... is a variadic parameter
        
        for textField in textFields {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = #colorLiteral(red: 0.6571641564, green: 0.6571640372, blue: 0.6571640372, alpha: 1)
            textField.layer.cornerRadius = 10
            textField.layer.masksToBounds = true
        }
    }


    //MARK: -  selectButton  for menu with underline UI

    public func selectButton(for button: UIButton, deselectButtons: [UIButton], selectedButtonBar:inout UIView?) {
        
        for deselectButton in deselectButtons {
            deselectButton.isSelected = false
        }
        
        button.isSelected = true
        selectedButtonBar?.removeFromSuperview()
        selectedButtonBar = UIView.init(frame: CGRect(x: 0.0, y: button.frame.size.height , width: button.frame.size.width, height: 3.0))
        selectedButtonBar?.backgroundColor = UIColor(named: K.Colors.Pink)
        button.addSubview(selectedButtonBar!)
        

    }
    
    
    
    //MARK: -  Function to dismiss keyboard on tap
    public func addTapGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    //MARK: -  textFieldShouldReturn - dismiss keyboard when clicking in viewController

    @objc  func textFieldShouldReturn(_ textField: UITextField) -> Bool { //dismiss keyboard when clicking enter key on keyboard
        textField.resignFirstResponder()
        return true
    }
}

//MARK: -  UIImageView

extension UIImageView {
    public func makeRoundCorners(byRadius rad: CGFloat) {
        self.layer.cornerRadius = rad
        self.clipsToBounds = true
    }
}



//MARK: -  UIView extension for button to shake

extension UIView {


    // Using CAMediaTimingFunction
    public func shake(duration: TimeInterval = 0.5, values: [CGFloat]) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")

        // Swift 4.2 and above
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)

        // Swift 4.1 and below
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)


        animation.duration = duration // You can set fix duration
        animation.values = values  // You can set fix values here also
        self.layer.add(animation, forKey: "shake")
    }


    // Using SpringWithDamping
    public func shake(duration: TimeInterval = 0.5, xValue: CGFloat = 12, yValue: CGFloat = 0) {
        self.transform = CGAffineTransform(translationX: xValue, y: yValue)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)

    }


    // Using CABasicAnimation
    public func shake(duration: TimeInterval = 0.05, shakeCount: Float = 6, xValue: CGFloat = 12, yValue: CGFloat = 0){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = shakeCount
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - xValue, y: self.center.y - yValue))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + xValue, y: self.center.y - yValue))
        self.layer.add(animation, forKey: "shake")
    }

}

//MARK: -  CreateAlert with error when pressing Registration/ LogIn button
protocol CreateAlert {
    func  createAlert(from viewController:UIViewController, errorText error:String)
}

extension CreateAlert {
    
        func createAlert(from viewController:UIViewController, errorText error:String) {
            // Create a new alert
            
            let dialogMessage = UIAlertController(title: "Увага", message:error, preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            })
            dialogMessage.addAction(ok)

            // Present alert to user
            viewController.present(dialogMessage, animated: true, completion: nil)
            
        }
}
