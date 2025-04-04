//
//  TabView.swift
//  FoodTracker
//
//  Created by Marcel Ott on 22.08.24.
//

import SwiftUI

struct ContentView: View {
 
    var body: some View {
        TabView {
           EntryListView()
                
                .tabItem {
                    Label("Essen", systemImage: "fork.knife")
                        
                }

               
            DrinkListView(waterType: .constant([]))
                
                .tabItem {
                    Label("Wasser", systemImage: "drop")
                    
                }
            
        }
        
    }
        
}
