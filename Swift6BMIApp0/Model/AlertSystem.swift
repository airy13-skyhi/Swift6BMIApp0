//
//  AlertSystem.swift
//  Swift6BMIApp0
//
//  Created by Manabu Kuramochi on 2021/05/31.
//

import Foundation
import EMAlertController


class AlertSystem {
    
    static func showAlert(title:String, message:String, buttonTitle:String, viewController:UIViewController) {
        
        let alert = EMAlertController(title: title, message: message)
        let close = EMAlertAction(title: title, style: .cancel)
        
        alert.cornerRadius = 10.0
        alert.iconImage = UIImage(named: "ok")
        alert.addAction(close)
        viewController.present(alert, animated: true, completion: nil)
        
    }
    
    
}
