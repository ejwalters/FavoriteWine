//
//  WineCell.swift
//  Favorite-Wine-08-20-2016
//
//  Created by Eric Walters on 8/21/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//

import UIKit

class WineCell: UITableViewCell {
    
    
    @IBOutlet weak var wineDesc: UILabel!
    @IBOutlet weak var wineTitle: UILabel!
    @IBOutlet weak var wineImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        wineImage.layer.cornerRadius = 2.0
        wineImage.clipsToBounds = true
    }
    
    
    func configureCell(wine: Wine) {
        wineTitle.text = wine.title
        wineDesc.text = wine.descript
        wineImage.image = wine.getWineImage()
    }
    
}
