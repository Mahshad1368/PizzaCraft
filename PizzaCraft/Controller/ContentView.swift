//
//  ContentView.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 29.08.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Pizza")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.4)
                
                VStack {
                            NavigationLink(destination: PizzaSelectionView()) {
                                Text("Choose Pizza")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding()
                            
                            NavigationLink(destination: CartView()) {
                                Text("Shopping Basket")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding()
                        }
                .navigationTitle("Pizza Order")
            }
                    
                }
            }
        }

#Preview {
    ContentView()
}
