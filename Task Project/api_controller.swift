//
//  api_controller.swift
//  
//
//  Created by Rajeev Roushan on 13/03/18.
//

import Foundation
import UIKit
import ObjectiveC

//MARK: toast ectention

public extension UIView
{
    
    public func show(message: String, controller: UIViewController, color : UIColor , time : TimeInterval )
    {
        var toastLabel = UILabel()

        toastLabel = UILabel(frame: CGRect(x: 8, y: 19, width: controller.view.frame.size.width-16, height: 0))
        toastLabel.textColor = UIColor.white
        toastLabel.backgroundColor = UIColor.red
        toastLabel.layer.cornerRadius = 5.0
        toastLabel.layer.masksToBounds = true
        toastLabel.textAlignment = .center;
        toastLabel.font.withSize(12.0)
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 2
       // toastContainer.addSubview(toastLabel)
        
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleToastTapped(_:)))
        recognizer.direction = . up
       
        toastLabel.addGestureRecognizer(recognizer)
        toastLabel.isUserInteractionEnabled = true
        toastLabel.isExclusiveTouch = true
        controller.view.addSubview(toastLabel)


        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations:
            {
            toastLabel.frame = CGRect(x: 8, y: 19 , width: controller.view.frame.size.width-16, height: 70)
        })
        

    }
    @objc
     func handleToastTapped(_ recognizer: UISwipeGestureRecognizer ) {
       print("dgfd dgdf")
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                recognizer.view?.frame = CGRect(x: 8, y: 19 , width: (self.frame.size.width-16), height: 0)
            
                
        })
    }
}




