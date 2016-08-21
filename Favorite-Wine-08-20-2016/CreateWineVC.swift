//
//  CreateWineVC.swift
//  Favorite-Wine-08-20-2016
//
//  Created by Eric Walters on 8/21/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//

import UIKit
import CoreData

class CreateWineVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var wineTitle: UITextField!
    @IBOutlet weak var wineDesc: UITextField!
    //@IBOutlet weak var wineUrl: UITextField!
    @IBOutlet weak var wineImage: UIImageView!
    @IBOutlet weak var addWineButton: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        wineImage.layer.cornerRadius = 4.0
        wineImage.clipsToBounds = true
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        wineImage.image = image
    }
    
    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createWine(sender: AnyObject!) {
        if let title = wineTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            print(app)
            let context = app.managedObjectContext
            print(context)
            let entity = NSEntityDescription.entityForName("Wine", inManagedObjectContext: context)!
            print(entity)
            let wine = Wine(entity: entity, insertIntoManagedObjectContext: context)
            wine.title = title
            wine.descript = wineDesc.text
            wine.setWineImage(wineImage.image!)
            
            context.insertObject(wine)
            
            do {
                try context.save()
            } catch {
                print("Could not save wine!")
            }
            
            self.dismissViewControllerAnimated(true, completion: nil)

        }
    }
    
    
}