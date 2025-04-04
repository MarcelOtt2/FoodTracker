//
//  Entry.swift
//  FoodTracker
//
//  Created by Marcel Ott on 20.08.24.
//

import SwiftUI

struct Entry: Identifiable{
    let id: String = UUID().uuidString
    var title: String
    var date: Date
    var calories: Int
    
}
