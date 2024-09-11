//
//  ContentView.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 29.08.24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \PizzaItemCoreData.name, ascending: true)],
                  animation: .default)
    private var pizzaItems: FetchedResults<PizzaItemCoreData>
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Image("Image1")
                    .resizable()
                    .ignoresSafeArea()
                
                Image("mahshad")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.9)
                
                
                
                
                VStack {
                    Spacer()
                    NavigationLink(destination: PizzaSelectionView()) {
                        Text("Choose Pizza")
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    
                    
                    NavigationLink(destination: CartView()) {
                        Text("Shopping Basket")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .padding()
                    
                }
                .frame(maxWidth: UIScreen.main.bounds.width)
                .fontWeight(.black)
                .navigationTitle("")
                .shadow(color: .gray, radius: 5, x:2, y:2)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
