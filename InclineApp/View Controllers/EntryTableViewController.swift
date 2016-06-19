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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

}
