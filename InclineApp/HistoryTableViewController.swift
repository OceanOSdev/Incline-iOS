//
//  HistoryTableViewController.swift
//  InclineApp(2ndIteration)
//
//  Created by Jake Schroeder on 6/4/16.
//  Copyright © 2016 Incline. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    //Exit Button Method
    
    @IBAction func btnExit(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    var totalHeightValuesDest: [Int] = []
    var totalWeightValuesDest: [Int] = []
    var totalBodyFatValuesDest: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if totalHeightValuesDest.count > 0 {
            return totalHeightValuesDest.count
        }
        else if totalWeightValuesDest.count > 0 {
            return totalWeightValuesDest.count
        }
        else {
           return totalBodyFatValuesDest.count
        }
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        if totalHeightValuesDest.count > 0 {
            
            cell.textLabel?.text = "\(totalHeightValuesDest[indexPath.row]) in"
            
        }
        else if totalWeightValuesDest.count > 0 {
            
            cell.textLabel?.text = "\(totalWeightValuesDest[indexPath.row]) lbs"
        }
        else if totalBodyFatValuesDest.count > 0 {
            
            cell.textLabel?.text = "\(totalBodyFatValuesDest[indexPath.row]) %"
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            totalHeightValuesDest.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            print(totalHeightValuesDest)
        } else if editingStyle == .Insert {
            
        }
    }


}
