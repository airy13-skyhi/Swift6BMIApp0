//
//  GetDateModel.swift
//  Swift6BMIApp0
//
//  Created by Manabu Kuramochi on 2021/05/29.
//

import Foundation


class GetDateModel {
    
    
    func getTodayDate() -> String {
        
        
        let f = DateFormatter()
        f.timeStyle = .none
        f.dateStyle = .full
        f.locale = Locale(identifier: "ja_JP")
        
        let now = Date()
        
        return f.string(from: now)
    }
    
    
    
    
}

