//
//  PizzaModel.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 03.09.24.
//

import Foundation

struct PizzaOrderModel {
    
        var dough : Dough
        var toppings :Set<Topping>
        var pizzaType : Pizza
    
    func getString() -> String {
        let toppingString = toppings.map {$0.rawValue}.joined(separator: ", ")

        var title =    """
                        Pizza Name: \(pizzaType.rawValue)
                        Type Dough: \(dough.name())
                        """
        // Margarita - Ham - Thick
        if !toppings.isEmpty {
            title +=  "\nToppings: \(toppingString)"
        }
        return title
    }
    
    func price() -> Double {
        let totalPrice = pizzaType.price()
        + dough.price()
        + toppings.map {
            $0.price()
        }.reduce(0, +)
        
        //SUM WITH FOR IN
        
//        for item in toppings {
//            totalPrice += item.price()
//        }
//        return totalPrice
//        
        //SUM WITH REDUCE()
//        toppings.reduce(0) { sum , item in
//            sum + item.price()
//        }
        return totalPrice
    }

}

enum Pizza: String, CaseIterable {
    case Margarita = "Margarita"
    case Pepperoni = "Pepperoni"
    case Salami = "Salami "
    
    
    func price() -> Double {
        switch self {
        case .Margarita : 7.0
        case .Pepperoni : 6.0
        case .Salami : 5.0
        }
    }
    
    func imageName() -> String {
        switch self {
        case .Margarita : "Margarita"
        case .Pepperoni : "Pepperoni"
        case .Salami : "Salami"
        }
    }
}
@objc
public enum Dough: Int16, CaseIterable {
    case Thick
    case Thin
    
    func price() -> Double {
        switch self {
            
        case .Thick: 2.0
        case .Thin: 3.0
        }
    }
    func name() -> String {
        switch self{
        case .Thin:"Thin"
        case .Thick:"Thick"
        }
    }
}

enum Topping: String, CaseIterable {
    
    case Ham = "Ham"
    case Salami = "Salami"
    case Mushrooms = "Mushrooms"
    case BellPeppers = "Bell Peppers"
    

    func price() -> Double {
        
        switch self {
        case .Ham : 1.50
        case .BellPeppers: 2.0
        case .Mushrooms: 1.2
        case .Salami: 2.30
            
        }
    }
}


//@State var toppingOptions = ["Ham", "Salami", "Mushrooms", "Bell Peppers"]
