//
//  Wine+CoreDataProperties.swift
//  Favorite-Wine-08-20-2016
//
//  Created by Eric Walters on 8/21/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Wine {

    @NSManaged var descript: String?
    @NSManaged var image: NSData?
    @NSManaged var title: String?

}
