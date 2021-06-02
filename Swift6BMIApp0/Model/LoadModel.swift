//
//  LoadModel.swift
//  Swift6BMIApp0
//
//  Created by Manabu Kuramochi on 2021/05/31.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


protocol GetDataProtocol {
    
    func getData(dataArray:[PersonalData])
}


protocol GetRankProtocol {
    
    func getRankData(dataArray:[RankData])
}


class LoadModel {
    
    let db = Firestore.firestore()
    var personalDataArray = [PersonalData]()
    var rankDataArray = [RankData]()
    var getDataProtocol:GetDataProtocol?
    var getRankProtocol:GetRankProtocol?
    
    
    
    func loadMyRecordData(userID:String, yearMonth: String, day:String) {
        
        db.collection("UserID").document(userID).collection(yearMonth).addSnapshotListener { snapShot, error in
            
            self.personalDataArray = []
            
            if error != nil {
                
                return
            }
            
            if let snapShotDoc = snapShot?.documents {
                
                for doc in snapShotDoc {
                    
                    let data = doc.data()
                    
                    if let userID = data["userID"] as? String, let userName = data["userName"] as? String, let weight = data["weight"] as? String, let date = data["date"] as? Double {
                        
                        
                        let newPersonalData = PersonalData(userID: userID, userName: userName, weight: weight, date: date)
                        
                        
                        self.personalDataArray.append(newPersonalData)
                        
                    }
                    
                }
                
            }
            
            self.getDataProtocol?.getData(dataArray: self.personalDataArray)
            
        }
        
    }
    
    
    
    
    func loadRankingData(userID:String) {
        
        var rankNumber = 0
        var doneNumber = Int()
        
        db.collection("RankingData").order(by: "resultWeight").addSnapshotListener { snapShot, error in
            
            self.rankDataArray = []
            
            if error != nil {
                return
            }
            
            if let snapShotDoc = snapShot?.documents {
                
                for doc in snapShotDoc {
                    
                    let data = doc.data()
                    
                    
                    if let userID = data["userID"] as? String, let userName = data["userName"] as? String, let resultWeight = data["resultWeight"] as? String {
                        
                        
                        let newRankData = RankData(userName: userName, resultWeight: resultWeight, userID: userID)
                        
                        self.rankDataArray.append(newRankData)
                        rankNumber += 1
                        
                        if newRankData.userID == Auth.auth().currentUser?.uid {
                            
                            doneNumber = rankNumber
                        }
                    }
                    
                }
                
            }
            self.getRankProtocol?.getRankData(dataArray: self.rankDataArray)
            
        }
        
    }
    
    
    
    
}
