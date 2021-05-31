//
//  LoadModel.swift
//  Swift6BMIApp0
//
//  Created by Manabu Kuramochi on 2021/05/31.
//

import Foundation
import FirebaseFirestore


protocol GetDataProtocol {
    
    func getData(dateArray:[PersonalData])
    
}

class LoadModel {
    
    let db = Firestore.firestore()
    var personalDataArray = [PersonalData]()
    var getDataProtocol:GetDataProtocol?
    
    
    
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
            
            
        }
        
    }
    
    
}
