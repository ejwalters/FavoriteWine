//
//  Wine.swift
//  Favorite-Wine-08-20-2016
//
//  Created by Eric Walters on 8/21/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Wine: NSManagedObject {
    
    
    func setWineImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getWineImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }
    
}