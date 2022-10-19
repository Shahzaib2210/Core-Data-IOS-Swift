//
//  Student+CoreDataProperties.swift
//  Core Data
//
//  Created by Shahzaib on 10/23/21.
//  Copyright © 2021 Shahzaib. All rights reserved.
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
