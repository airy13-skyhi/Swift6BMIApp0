//
//  RecordViewController.swift
//  Swift6BMIApp0
//
//  Created by Manabu Kuramochi on 2021/05/29.
//

import UIKit



class RecordViewController: UIViewController {
    
    var calcWeightModel = CalcWeightModel()
    var sendModel = SendModel()
    var alertSystem = AlertSystem()
    
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bodyWeightLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var aprropriateWeightUILabel: UILabel!
    @IBOutlet weak var aprropriateWeightLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dateLabel.text = GetDateModel.getTodayDate(slash: false)
        dateLabel.layer.cornerRadius = 25.0
        bodyWeightLabel.layer.cornerRadius = 25.0
        aprropriateWeightUILabel.layer.cornerRadius = 25.0
        
        
        aprropriateWeightLabel.text = "\(calcWeightModel.calcAprropriateWeight())kg"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputTextField.resignFirstResponder()
    }
    
    
    
    @IBAction func recordWeight(_ sender: Any) {
        
        sendModel.sendResultWeightToDB(userName: GetUserDataModel.getUserData(key: "userName"), weight: inputTextField.text!)
        
        AlertSystem.showAlert(title: "保存されました！", message: "", buttonTitle: "OK", viewController: self)
        
    }
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
