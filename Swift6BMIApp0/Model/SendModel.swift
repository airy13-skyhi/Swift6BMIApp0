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
    
    
    func sendTodayWeightToDB(userName:String, weight:String) {
        
        var date = GetDateModel.getTodayDate(slash: true)
        
        for i in 0...1 {
            
            if let slash = date.range(of: "/") {
                date.replaceSubrange(slash, with: "")
                print(date)
            }
        }
        
        
        let collectionID = date.prefix(6)
        let documentID = date.suffix(2)
        
        
        
        if UserDefaults.standard.object(forKey: "today") != nil {
            
            
            
        }else {
            
            
            UserDefaults.standard.setValue(date, forKey: "today")
            UserDefaults.standard.setValue(1, forKey: "done")
        }
        
        
        if UserDefaults.standard.object(forKey: "today") as! String != date {
            
            db.collection("Users").document(fbAuth.currentUser!.uid).collection(String(collectionID)).document(String(documentID)).setData(["userName":userName, "userID":fbAuth.currentUser!.uid, "weight":weight, "date":Date().timeIntervalSince1970])
            
            
            UserDefaults.standard.setValue(date, forKey: "today")
            UserDefaults.standard.setValue(0, forKey: "done")
            
        }else if UserDefaults.standard.object(forKey: "today") as! String == date && UserDefaults.standard.object(forKey: "done") as! Int == 0 {
            
            
            db.collection("Users").document(fbAuth.currentUser!.uid).collection(String(collectionID)).document(String(documentID)).updateData(["weight":weight])
            
            UserDefaults.standard.setValue(date, forKey: "today")
            
        }
        
        
        
    }
    
    
}


