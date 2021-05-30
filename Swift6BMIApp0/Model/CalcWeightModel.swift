//
//  CalcWeightModel.swift
//  Swift6BMIApp0
//
//  Created by Manabu Kuramochi on 2021/05/29.
//

import Foundation




class CalcWeightModel {
    
    
    var getUserDataModel = GetUserDataModel()
    
    
    
    func calcAprropriateWeight() -> String {
        
        var aprropriateWeight = pow(Double(getUserDataModel.getUserData(key: "height"))!/100.00,2) * 22
        
        aprropriateWeight = round(aprropriateWeight*10)/10
        
        return String(aprropriateWeight)
        
    }
    
    
    
}

