//
//  SettingViewController.swift
//  Swift6BMIApp0
//
//  Created by Manabu Kuramochi on 2021/06/02.
//

import UIKit

class SettingViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

        
    }
    
    
    
    
    @IBAction func done(_ sender: Any) {
        
        if heightTextField.text?.isEmpty != true {
            
            UserDefaults.standard.setValue(self.heightTextField.text, forKey: "height")
        }
        
        
        if weightTextField.text?.isEmpty != true {
            
            UserDefaults.standard.setValue(self.weightTextField.text, forKey: "weight")
        }
        
        
        
        AlertSystem.showAlert(title: "保存されました！", message: "", buttonTitle: "完了", viewController: self)
    }
    

    

}
