//
//  AddDrinkView.swift
//  FoodTracker
//
//  Created by Marcel Ott on 22.08.24.
//

import SwiftUI

struct AddDrinkView: View {
    @Binding var showSheet: Bool
    @Binding var water: [Drink]
    @State private var waterName = ""
    @State private var calories1 = 0.0
    @State private var amount = 250.0
    @State private var selectedDrinkType: DrinkType = .water
    
    var body: some View {
        NavigationStack {
            
            Form {
                
                
                Section(header: Text("Neues Trinken")) {
                    TextField("Drink Name", text: $waterName)
                    Picker("Drinks", selection: $selectedDrinkType) {
                        
                        ForEach(DrinkType.allCases) { selectedDrinkType in
                            Text(selectedDrinkType.rawValue).tag(selectedDrinkType)
                                .padding(.horizontal)
                        }
                    }
                }
                Slider(value: $amount, in: 0...5000)
                HStack{
                    Text(String(format: "%.0F" , amount))
                    Text("ml")
                }
                    Slider(value: $calories1, in: 0...800)
                    HStack{
                    Text(String(format: "%.0F" , calories1))
                    Text("kcal")
                }
            }
            
            .navigationTitle("Trinken hinzufügen")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        showSheet = false
                        
                    }
                label:{
                    Image(systemName: "x.circle")
                        .tint(.red)
                }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addDrink()
                    }
                label:{
                    Image(systemName: "lock.doc")
                }
                }
            
            }
        }
    }
    
    private func addDrink() {
        let newDrink = Drink(name: waterName, date: Date(), calories: Int(calories1), amount: Int(amount))
        water.append(newDrink)
        waterName = ""
        
    }
}



