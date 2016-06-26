//
//  AccountTableViewController.swift
//  InclineApp(2ndIteration)
//
//  Created by Jake Schroeder on 5/31/16.
//  Copyright © 2016 Incline. All rights reserved.
//

import UIKit

class AccountTableViewController: UITableViewController {

    @IBAction func btnExit(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    // Author: Thomas Maloney
    // Desc: Handles the logout logic for the application
    @IBAction func btnLogOut(sender: AnyObject) {
        //TODO: Handle invalid state that will inevitably be passed around the application during runtime
        
        WebApiConnector.logOut()

        let alertController = UIAlertController(title: "Log Out Successful", message: "Warning: Application may be unstable until next sign in.", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))

        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
