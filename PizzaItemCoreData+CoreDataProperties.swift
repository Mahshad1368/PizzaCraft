//
//  PizzaItemCoreData+CoreDataProperties.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 06.09.24.
//
//

import Foundation
import CoreData


extension PizzaItemCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PizzaItemCoreData> {
        return NSFetchRequest<PizzaItemCoreData>(entityName: "PizzaItemCoreData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var pizzaType: String?
    @NSManaged public var dough: String?
    @NSManaged public var toppings: String?
    @NSManaged public var count: Int64
    @NSManaged public var price: Double

}

extension PizzaItemCoreData : Identifiable {

}
