//
//  DetailsVC.swift
//  Favorite-Wine-08-20-2016
//
//  Created by Eric Walters on 8/21/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//

import UIKit
import CoreData


class DetailsVC: UIViewController {
    
    var newCell: WineCell!
    @IBOutlet weak var wineTitle: UILabel!
    @IBOutlet weak var wineDescription: UILabel!
    @IBOutlet weak var wineUrl: UILabel!
    @IBOutlet weak var wineImage: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        wineTitle.text = newCell.wineTitle.text
        wineDescription.text = newCell.wineDesc.text
        wineImage.image = newCell.wineImage.image
        wineImage.clipsToBounds = true
    }
    
}
