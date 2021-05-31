//
//  ChartViewController.swift
//  Swift6BMIApp0
//
//  Created by Manabu Kuramochi on 2021/05/31.
//

import UIKit
import Charts

class ChartViewController: UIViewController, ChartViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    
    let years = (2021...2031).map{ $0 }
    let month = (1...12).map{ $0 }

    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pickerView.delegate = self
        pickerView.dataSource = self
        chartView.backgroundColor = .white
        chartView.alpha = 0.9
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let date = GetDateModel.getTodayDate(slash: true)
        let dateArray = date.components(separatedBy: "/")
        
        
        
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
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
