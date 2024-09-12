//
//  ContentView.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 29.08.24.
//

import SwiftUI
import CoreData

enum AppScreen: Hashable{
    case pizzaDetail(Pizza)
    case cart
    case selectPizza
    case checkOut
}

struct ContentView: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \PizzaItemCoreData.name, ascending: true)],
                  animation: .default)
    private var pizzaItems: FetchedResults<PizzaItemCoreData>
    @Environment(\.managedObjectContext) private var viewContext
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
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
                    Button(action: {
                        path.append(AppScreen.selectPizza)
                    }, label: {
                        Text("Choose Pizza")
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    })

                    NavigationLink(destination: CartView(path: $path)) {
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
            .navigationDestination(for: AppScreen.self) { screen in
                switch screen {
                case .pizzaDetail(let pizza):
                    PizzaDetailView(path: $path, pizza: pizza)
                case .cart:
                    CartView(path: $path)
                case .selectPizza:
                    PizzaSelectionView(path: $path)
                case .checkOut:
                    CheckOut()
                }
                
            }
        }
    }
}
#Preview {
    ContentView()
}
