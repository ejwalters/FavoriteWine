//
//  ViewController.swift
//  Favorite-Wine-08-20-2016
//
//  Created by Eric Walters on 8/20/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var wineList = [Wine]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    func fetchAndSetResults() {
        //Getting the application delegate
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Wine")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.wineList = results as! [Wine]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("WineCell") as? WineCell {
            let wine = wineList[indexPath.row]
            
            cell.configureCell(wine)
            return cell
        } else {
            return WineCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wineList.count
    }
    
    
    var currentCell: WineCell!
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        currentCell = tableView.cellForRowAtIndexPath(indexPath)! as? WineCell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "Details") {
            if let viewC = segue.destinationViewController as? DetailsVC{
                if let newCell = sender as? WineCell {
                    viewC.newCell = newCell
                    
                }
                
            }
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //Deleting from Core Data
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            let app  = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            context.deleteObject(wineList[indexPath.row])
            wineList.removeAtIndex(indexPath.row)
            do {
                try context.save()
            } catch _ {
            }
            
            //Delete from tableView
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    
    
}


