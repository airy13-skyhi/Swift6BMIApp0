//
//  ViewController.swift
//  Swift6BMIApp0
//
//  Created by Manabu Kuramochi on 2021/05/29.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {
    
    
    let firebaseAuth = Auth.auth()
    
    
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    
    
    
    @IBAction func done(_ sender: Any) {
        
        if textField.text?.isEmpty != true && heightField.text?.isEmpty != true {
            
            firebaseAuth.signInAnonymously { Result, Error in
                
                
                if Error != nil {
                
                    print(Error.debugDescription)
                    
                }else {
                    
                    
                    UserDefaults.standard.setValue(self.textField.text, forKey: "userName")
                    UserDefaults.standard.setValue(self.heightField.text, forKey: "height")
                    
                    
                    let tabVC = self.storyboard?.instantiateViewController(identifier: "tabVC") as! TabViewController
                    
                    self.navigationController?.pushViewController(tabVC, animated: true)
                }
                
                
                
            }
            
            
        }
        
        
    }
    
    
    
    
    

}

