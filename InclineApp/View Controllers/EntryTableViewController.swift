//
//  EntryTableViewController.swift
//  InclineApp(2ndIteration)
//
//  Created by Jake Schroeder on 6/1/16.
//  Copyright © 2016 Incline. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController {
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        WebApiConnector.getToken(false, parent: self) {
            (result: String?, error: NSError?) -> Void in
            if result != nil {
                print(result)
            }
            else {
                
            }
        }


    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    //Table data source not needed if not data is being used in the table

}
