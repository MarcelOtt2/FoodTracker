//
//  AddEntryViews.swift
//  FoodTracker
//
//  Created by Marcel Ott on 20.08.24.
//

import SwiftUI

struct AddEntryViews: View {
    @Binding var showSheet: Bool
    @Binding var food: [Entry]
    @State private var mealName = ""
    @State private var calories = 0.0
    @State private var selectedFoodType: FoodEnum = .breakfest
    
    var body: some View {
        NavigationStack {
            
            Form {
                
                
                Section(header: Text("Neue Mahlzeit")) {
                    TextField("Mahlzeit Name", text: $mealName)
                    Picker("Essen", selection: $selectedFoodType) {
                        
                        ForEach(FoodEnum.allCases) { selectedFoodType in
                            Text(selectedFoodType.rawValue).tag(selectedFoodType)
                                .padding(.horizontal)
                        }
                    }
                }
                Slider(value: $calories, in: 0...800)
                HStack{
                    Text(String(format: "%.0F" , calories))
                    Text("kcal")
                }
            }
            
            .navigationTitle("Mahlzeit hinzufügen")
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
                        addFood()
                    }
                label:{
                    Image(systemName: "lock.doc")
                }
                }
            
            }
        }
    }
    
    private func addFood() {
        let newFood = Entry(title: mealName, date: Date(), calories: Int(calories) )
        food.append(newFood)
        mealName = ""
        
    }
}

