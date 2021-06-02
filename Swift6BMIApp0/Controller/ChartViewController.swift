//
//  ChartViewController.swift
//  Swift6BMIApp0
//
//  Created by Manabu Kuramochi on 2021/05/31.
//

import UIKit
import Charts
import Firebase
import FirebaseAuth

class ChartViewController: UIViewController, ChartViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, GetDataProtocol {
    
    
    var chartArray = [PersonalData]()
    var sendModel = SendModel()
    var loadModel = LoadModel()
    var fbAuth = Auth.auth()
    
    
    
    let years = (2021...2031).map{ $0 }
    let months = (1...12).map{ $0 }

    
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
        
        loadModel.getDataProtocol = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let date = GetDateModel.getTodayDate(slash: true)
        let dateArray = date.components(separatedBy: "/")
        
        loadModel.loadMyRecordData(userID: fbAuth.currentUser!.uid, yearMonth: dateArray[0] + dateArray[1], day: dateArray[2])
        
    }
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            
            return years.count
            
        }else if component == 1 {
            
            return months.count
            
        }else {
            return 0
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            return "\(years[row])年"
            
        }else if component == 1 {
            
            return "\(months[row])月"
            
        }else {
            
            return nil
        }
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let year = years[pickerView.selectedRow(inComponent: 0)]
        let month = months[pickerView.selectedRow(inComponent: 1)]
        
        var month2nd = String()
        
        if month < 10 {
            
            month2nd = "0" + String(month)
            dateLabel.text = "\(years)年\(month2nd)月"
            
            loadModel.loadMyRecordData(userID: fbAuth.currentUser!.uid, yearMonth: String(year) + String(month), day: "")
            
        }
        pickerView.isHidden = true
        
    }
    
    
    
    
    func getData(dataArray: [PersonalData]) {
        
        chartArray = dataArray
        
        setUpChart(values: chartArray)
        
        if chartArray.count > 0 {
            
            resultLabel.text = String(Double(chartArray.last!.weight)! - Double(chartArray.first!.weight)!)
            
            
            sendModel.sendResultWeightToDB(userName: GetUserDataModel.getUserData(key: "userName"), weight: resultLabel.text!)
        }
        
        
    }
    
    
    
    func setUpChart(values:[PersonalData]) {
        
        
        let formatter:DateFormatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateStyle = .short
        
        
        var entry = [ChartDataEntry]()
        
        for i in 0 ..< values.count {
            
            let date = Date(timeIntervalSince1970: values[i].date)
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ja_JP")
            dateFormatter.dateFormat = "dd"
            
            let dateString = dateFormatter.string(from: date)
            
            entry.append(ChartDataEntry(x: Double(dateString)!, y: Double(values[i].weight)!))
            
        }
        
        
        let dataSet = LineChartDataSet(entries: entry, label: "My weight")
        chartView.data = LineChartData(dataSet: dataSet)
        
    }
    
    
    
    func setUpLineChart(_ chart:LineChartView, data:LineChartData) {
        
        chart.delegate = self
        chart.chartDescription?.enabled = true
        chart.dragEnabled = true
        chart.setScaleEnabled(true)
        chart.setViewPortOffsets(left: 30, top: 0, right: 0, bottom: 30)
        chart.legend.enabled = true
        
        chart.leftAxis.enabled = true
        chart.leftAxis.spaceTop = 0.4
        chart.leftAxis.spaceBottom = 0.4
        
        
        chart.rightAxis.enabled = false
        chart.xAxis.enabled = true
        chart.data = data
        chart.animate(xAxisDuration: 2)
        
    }
    
    
    
    @IBAction func toRankVC(_ sender: Any) {
        
        
        let rankVC = self.storyboard?.instantiateViewController(identifier: "rankVC") as! RankingViewController
        self.navigationController?.pushViewController(rankVC, animated: true)
        
        
    }
    
    
    
    @IBAction func tap(_ sender: Any) {
        
        
        pickerView.isHidden = false
    }
    
    
    
    
    
    
}
