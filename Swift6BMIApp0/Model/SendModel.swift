//
//  SendModel.swift
//  Swift6BMIApp0
//
//  Created by Manabu Kuramochi on 2021/05/31.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


class SendModel {
    
    
    let db = Firestore.firestore()
    var fbAuth = Auth.auth()
    
    
    func sendResultWeightToDB(userName:String, weight:String) {
        
        var date = GetDateModel.getTodayDate(slash: true)
        
        for i in 0...1 {
            
            if let slash = date.range(of: "/") {
                date.replaceSubrange(slash, with: "")
                print(date)
            }
        }
        
        
        let collectionID = date.prefix(6)
        let documentID = date.suffix(2)
        
        
        
        if UserDefaults.standard.object(forKey: "today2") != nil {
            
            
        }else {
            
            UserDefaults.standard.setValue(date, forKey: "today2")
            UserDefaults.standard.setValue(1, forKey: "done2")
        }
        
        
        
        
        
        
        if UserDefaults.standard.object(forKey: "today2") as! String != date {
            
            db.collection("RankingData").document(fbAuth.currentUser!.uid).setData(["userName":userName, "userID":fbAuth.currentUser!.uid, "resultWeight":weight])
            
            UserDefaults.standard.setValue(date, forKey: "today2")
            UserDefaults.standard.setValue(0, forKey: "done2")
            
            
        }else if UserDefaults.standard.object(forKey: "today2") as! String == date && UserDefaults.standard.object(forKey: "done2") as! Int == 0 {
            
            
            db.collection("RankingData").document(fbAuth.currentUser!.uid).updateData(["userName":userName, "userID":fbAuth.currentUser!.uid, "resultWeight":weight])
            
            UserDefaults.standard.setValue(date, forKey: "today2")
            
            
        }else {
            
            db.collection("RankingData").document(fbAuth.currentUser!.uid).setData(["userName":userName, "userID":fbAuth.currentUser!.uid, "resultWeight":weight])
            
        }
        UserDefaults.standard.setValue(date, forKey: "today2")
        UserDefaults.standard.setValue(0, forKey: "done2")
        
    }
    
    
}


