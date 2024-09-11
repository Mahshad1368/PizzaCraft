//
//  ShoppingCart.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 03.09.24.
//

import Foundation
import SwiftUI
import CoreData


struct PizzaItem: Identifiable, Hashable {
 
    var id: UUID = UUID()
    var pizzaOrderModel: PizzaOrderModel
    var count: Int
    
    // Implement the hash function
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // Conform to Equatable protocol for Hashable
    static func == (lhs: PizzaItem, rhs: PizzaItem) -> Bool {
        return lhs.id == rhs.id
    }
}
class ShoppingCart: ObservableObject {

    @Published private var pizzaList : [PizzaItem] = []
    
    func addPizza(pizza: PizzaOrderModel, quantity: Int) {
        pizzaList.append(PizzaItem(pizzaOrderModel: pizza, count: quantity))
    }

    func totalPrice() -> Double {
        var result = 0.0
        for item in pizzaList {
            result += (item.pizzaOrderModel.price() * Double(item.count))
        }
        return result
        //        pizzaList.reduce(into: 0) { sum ,item in sum + (item.pizza.price * Double(item.count))}
    }
    func getPizzaOrderList() -> [PizzaItem] {
      return pizzaList 
    }
    
    
//    func removePizza(pizza: String) {
//        
//        if let index = pizzaList.firstIndex(where: { $0.pizzaOrderModel.pizzaType.rawValue == pizza}){
//            pizzaList.remove(at: index)
//        }
//    }
    
    func removePizza(indexSet: IndexSet) {
        
        if let index = indexSet.first {
           let removed = pizzaList.remove(at: index)
            
            print("removed \(removed)")
        }
    }
    
}
