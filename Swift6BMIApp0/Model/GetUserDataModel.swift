//
//  GetUserDataModel.swift
//  Swift6BMIApp0
//
//  Created by Manabu Kuramochi on 2021/05/29.
//

import Foundation


class GetUserDataModel {
    
    var result = String()
    
    
    func getUserData(key:String) -> String {
        
        if UserDefaults.standard.object(forKey: key) != nil {
            
            result = UserDefaults.standard.object(forKey: key) as! String
        }
        
        return result
    }
    
}

