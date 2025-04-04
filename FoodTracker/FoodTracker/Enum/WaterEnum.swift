//
//  WaterEnum.swift
//  FoodTracker
//
//  Created by Marcel Ott on 22.08.24.
//

import SwiftUI

enum DrinkType: String, CaseIterable, Identifiable{
    var id: String{self.rawValue}
    case water = "🥛 Wasser"
    case coffee = "☕️ Kaffee"
    case tea = "🍵 Tee"
    var watername: String{
        switch self {
        case .water:
            return ""
        case .coffee:
            return ""
        case .tea:
            return ""
            
        }
    }
}



