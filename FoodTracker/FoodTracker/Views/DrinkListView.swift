//
//  DrinkListView.swift
//  FoodTracker
//
//  Created by Marcel Ott on 22.08.24.
//

import SwiftUI
let backgroundGradient = LinearGradient(
    colors: [Color.red, Color.blue],
    startPoint: .top, endPoint: .bottom)
struct DrinkListView: View {
    @Binding var waterType: [DrinkType]
    @State private var showSheet = false
    @State private var drinks = [
        Drink(name: "Wasser", date: Date(), calories: 0, amount: 200),
        Drink(name: "Kaffee", date: Date(), calories: 4, amount: 200),
        Drink(name: "Apfelsaft", date: Date(), calories: 112, amount: 200),
        Drink(name: "Cola", date: Date(), calories:76, amount: 200)
    ]
    @State private var showAlert = false
    
    var body: some View {
            NavigationStack {
                
                List{
                    ForEach(drinks) { drink in
                    
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(drink.name)
                                Text(drink.date, format: .dateTime)
                            }
                            Spacer()
                            VStack{
                                Text("\(drink.amount)ml")
                                Text("\(drink.calories) kcal")
                            }
                        }
                        .swipeActions{
                            Button(role:.destructive){
                                
                                guard let index = drinks.firstIndex(where: { $0.id == drink.id }) else {
                                    print("")
                                    return
                                }
                                drinks.remove(at: index)
                            }label:{
                                Label("delete", systemImage: "trash" )
                            }
                        }
                    }
                }
            
            .alert("Achtung!", isPresented: $showAlert) {
                Button("Abbrechen", role: .cancel) {}
                Button("Löschen", role: .destructive) {
                    drinks.removeAll()
                }
            }
        message: {
            Text("Möchtest du wirklich alle Getränke löschen?")
        }
        .navigationTitle("Getränke")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                showAlert = true
            }) {        Button{
                showAlert = true
            }label:{
                Image(systemName: "trash")
                    .foregroundStyle(.red)
                    
          
            }
                        
                    }
                
            }
            }
        .toolbar{
            Button(action:{
                showSheet = true}){
                    Label("Hinzufügen", systemImage: "plus.circle")
                }
        }
        }
        
        
        
          
        
                .sheet(isPresented: $showSheet) {
                    AddDrinkView(showSheet: $showSheet, water: $drinks)
                        .presentationDetents([.medium, .large])
                    
                }
               
        }
}

