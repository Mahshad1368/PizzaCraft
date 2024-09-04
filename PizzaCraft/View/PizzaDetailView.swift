//
//  PizzaDetailView.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 03.09.24.
//

import SwiftUI


struct PizzaDetailView: View {
    
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    @State private var goToCartView: Bool = false
    
    let pizzaName : String
    
    @State private var selectedDough = "Thick"
    @State private var selectedTopping = Set<String>()
    @State private var pizzaQuantitySelected = 0
    
    @State var doughOptions = ["Thick", "Thin"]
    @State var toppingOptions = ["Ham", "Salami", "Mushrooms", "Bell Peppers"]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(pizzaName)
                    .font(.title)
                    .padding()
                
                Form {
                    Section(header: Text("Select Dough")) {
                        Picker("Dough Type",selection : $selectedDough) {
                            ForEach (doughOptions , id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        
                    }
                    Section (header: Text("Select Topping")){
                        ForEach(toppingOptions, id: \.self) {topping in
                            Toggle( topping,
                                    isOn: Binding(
                                        get: {
                                            selectedTopping.contains(topping)
                                        },
                                        set: { isSelected in
                                            if isSelected {
                                                selectedTopping.insert(topping)
                                                
                                            }else {
                                                selectedTopping.remove(topping)
                                            }
                                        }))
                        }
                    }
                    
                    Section(header: Text("Quantity")) {
//                        Picker("Number of Pizza", selection: $pizzaQuantitySelected) {
//                            ForEach(1..<10) { quantity in
//                                Text("\(quantity)")
//                            }
//                        }.pickerStyle(.menu)
                        Stepper(value: $pizzaQuantitySelected, in: 0...9) {
                            Text("Number of Pizza :\(pizzaQuantitySelected + 1 ) ")
                        }
                    }
                    
                    Section {
                        ZStack {
                            NavigationLink(destination: CartView(), isActive: $goToCartView) {
                            }.hidden()
                            Button {
                                let pizzaMaker = PizzaModel(dough: selectedDough, topping: selectedTopping, name: pizzaName, price: 10.0)
                                shoppingCart.addPizza(pizza: pizzaMaker, quantity: pizzaQuantitySelected + 1)
                                
                                    self.goToCartView = true
                                
                                print("Is worked")
                                
                            } label: {
                                Text("Add to Cart")
                                    .padding()
                                    .font(.headline)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(16)
                                    
                            }.buttonStyle(.plain)
                    
                        }.frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
            }
        }
       
        
        
//        }.navigationDestination(for: DestinationTarget.self) { destination in
//            switch destination {
//            case .CartView:
//                CartView()
//            }
//        }
    }
}
#Preview {
    PizzaDetailView(pizzaName: "Margarita")
        .environmentObject(ShoppingCart())
}
