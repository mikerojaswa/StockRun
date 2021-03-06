//
//  Stocks+CoreDataProperties.swift
//  
//
//  Created by Michael Rojas on 4/23/18.
//
//

import Foundation
import CoreData


extension Stocks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stocks> {
        return NSFetchRequest<Stocks>(entityName: "Stocks")
    }

    @NSManaged public var companyName: String?
    @NSManaged public var latestPrice: Double
    @NSManaged public var symbol: String?

}
