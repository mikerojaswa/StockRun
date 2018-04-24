//
//  Profile+CoreDataProperties.swift
//  
//
//  Created by Michael Rojas on 4/23/18.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var profileImage: NSData?

}
