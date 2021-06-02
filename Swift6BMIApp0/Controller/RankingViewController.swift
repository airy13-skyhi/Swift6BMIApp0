//
//  RankingViewController.swift
//  Swift6BMIApp0
//
//  Created by Manabu Kuramochi on 2021/06/01.
//

import UIKit
import FirebaseAuth



class RankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GetRankProtocol {
    
    
    var loadModel = LoadModel()
    var rankDataArray = [RankData]()
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadModel.getRankProtocol = self
        loadModel.loadRankingData(userID: Auth.auth().currentUser!.uid)

        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.contentView.backgroundColor = .clear
        
        let rankLabel = cell.contentView.viewWithTag(1) as! UILabel
        rankLabel.text = String(indexPath.row + 1)
        
        let nameLabel = cell.contentView.viewWithTag(2) as! UILabel
        nameLabel.text = rankDataArray[indexPath.row].userName
        
        let weightLabel = cell.contentView.viewWithTag(3) as! UILabel
        weightLabel.text = rankDataArray[indexPath.row].resultWeight
        
        if rankDataArray[indexPath.row].userID == Auth.auth().currentUser?.uid {
            
            cell.contentView.backgroundColor = .systemTeal
        }
        
        return cell
    }
    
    
    
    func getRankData(dataArray: [RankData]) {
        
        
        rankDataArray = dataArray
        tableView.reloadData()
        
    }
    
    
    
    
    
    

}
