//
// Created by Thomas Maloney on 6/18/16.
// Copyright (c) 2016 Incline. All rights reserved.
//

import UIKit

class ReuseableHistoryTableViewController: UITableViewController {

    @IBAction func btnExit(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet var connectionView: UITableView!
    
    var totalValuesDest: [String] = []
    var dateValuesDest: [String] = []
    var idValuesDest: [Int] = []
    var apiURL : String = ""
    var act: ActivityHelper = ActivityHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
         act = ActivityHelper(parentView: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 // TODO: Probably change the value to a dynamic one
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalValuesDest.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        if totalValuesDest.count > 0 {
            //cell.textLabel?.text = "\(totalValuesDest[indexPath.row])"
            cell.textLabel?.text = "\(totalValuesDest[indexPath.row])"
            (cell.contentView.subviews[1] as! UILabel).text = "\(dateValuesDest[indexPath.row])"
        }
        return cell
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            WebApiConnector.Delete("\(self.apiURL)/\(idValuesDest[indexPath.row])", data: nil, completion: { (dataTask, httpResponse) in
                self.totalValuesDest.removeAtIndex(indexPath.row)
                self.dateValuesDest.removeAtIndex(indexPath.row)
                self.idValuesDest.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                self.connectionView.reloadData()
            })
            /*totalValuesDest.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            print(totalValuesDest)*/
        } else if editingStyle == .Insert {

        }
    }
    
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "Delete" //or customize for each indexPath
    }
}
