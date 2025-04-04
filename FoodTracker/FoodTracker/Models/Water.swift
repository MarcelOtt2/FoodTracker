//
//  Water.swift
//  FoodTracker
//
//  Created by Marcel Ott on 22.08.24.
//

import SwiftUI

struct Drink: Identifiable {
    let id = UUID()
    var name: String
    var date: Date
    var calories: Int
    var amount: Int // in ml
}
