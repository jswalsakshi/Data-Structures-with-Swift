//
//  Student+CoreDataProperties.swift
//  CodaData Project
//
//  Created by Sakshi Jaiswal on 18/02/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var mobile: String?

}
