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
    
    @IBOutlet weak var togHide: UISwitch!
    
    
    @IBOutlet weak var txtPassword: UITextField!

    
    @IBAction func togChanged(sender: UISwitch) {
        
        if togHide.on {
            txtPassword.secureTextEntry = true
        }
        else
        {
            txtPassword.secureTextEntry = false
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
