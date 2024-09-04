//
//  PizzaModel.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 03.09.24.
//

import Foundation

struct PizzaOrderModel {
    
        var dough : Dough
        var topping : Set<String>
        var pizzaType : Pizza
    
    
    func price() -> Double {
        pizzaType.price() + dough.price()
        
    }
       
}


enum Pizza: String, CaseIterable {
    case Margarita = "Margarita Pizza"
    case Pepperoni = "Pepperoni Pizza"
    case Salami = "Salami Pizza"
    
    
    func price() -> Double {
        switch self {
        case .Margarita : 10.0
        case .Pepperoni : 12.0
        case .Salami : 8.0
        }
    }
    
   

}
enum Dough: String, CaseIterable {
    case Thick = "Thick"
    case Thin = "Thin"
    
    
    func price() -> Double {
        switch self {
            
        case .Thick: 2.0
        case .Thin: 3.0
            
        }
    }
}

