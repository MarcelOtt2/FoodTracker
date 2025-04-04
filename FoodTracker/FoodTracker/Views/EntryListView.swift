//
//  EntryListView.swift
//  FoodTracker
//
//  Created by Marcel Ott on 20.08.24.
//

import SwiftUI
// Erstellen von struct Entry List View
struct EntryListView: View {
    //Array für Essen
    @State private var showSheet = false
    @State private var entries = [
        Entry(title: "Apfel", date: Date(), calories: 52),
        Entry(title: "Salatgurke", date: Date(), calories: 12),
        Entry(title: "Bratwurst mit Pommes", date: Date(), calories: 750),
        Entry(title: "Döner", date: Date(), calories: 780)
    ]
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(entries) { entrie in
                 
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(entrie.title)
                            Text(entrie.date, format: .dateTime)
                        }
                        Spacer()
                        Text("\(entrie.calories) kcal")
                    }
                    
                    .swipeActions{
                        
                        Button(role:.destructive){
                            .alert("Achtung!", isPresented: $showAlert) {
                                Button("Abbrechen", role: .cancel) {}
                                Button("Löschen", role: .destructive) {
                                    entries.removeAll()
                                }
                            
                        message: {
                            Text("Möchtest du wirklich alle Einträge löschen?")
                        }
                            
                            guard let index = entries.firstIndex(where: { $0.id == entrie.id }) else {
                                print("")
                                return
                            }
                            entries.remove(at: index)
                            }label:{
                                
                                Label("delete", systemImage: "trash" )
                            }
                        }
                    }
                }
            }
            
            .alert("Achtung!", isPresented: $showAlert) {
                Button("Abbrechen", role: .cancel) {}
                Button("Löschen", role: .destructive) {
                    entries.removeAll()
                }
            }
        message: {
            Text("Möchtest du wirklich alle Einträge löschen?")
        }
        .navigationTitle("Essen")
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
                    AddEntryViews(showSheet: $showSheet, food: $entries)
                        .presentationDetents([.medium, .large])
                    
                }
        }
}





#Preview {
    EntryListView()
}
