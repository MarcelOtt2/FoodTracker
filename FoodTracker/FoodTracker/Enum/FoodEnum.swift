//
//  FoodEnum.swift
//  FoodTracker
//
//  Created by Marcel Ott on 21.08.24.
//

import SwiftUI

enum FoodEnum: String, CaseIterable, Identifiable{
    var id: String{self.rawValue}
    case breakfest = "🥪 Frühstück"
    case lunch = "🍔 Mittagessen"
    case dinner = "🍱 Abendessen"
    var foodname: String{
        switch self {
        case .breakfest:
            return "🥪"
        case .lunch:
            return "🍔"
        case .dinner:
            return "🍱"
            
        }
    }
}
