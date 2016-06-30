//
//  FlexibilityUITableViewController.swift
//  Incline
//
//  Created by Jake Schroeder on 6/22/16.
//  Copyright © 2016 Incline. All rights reserved.
//

import UIKit

class FlexibilityUITableViewController: UITableViewController {
    
    //TextField Outlets
    @IBOutlet weak var txtSitReach: UITextField!
    @IBOutlet weak var txtTrunkLift: UITextField!
    @IBOutlet weak var txtArmShoulder: UITextField!
    //Button Outlets
    @IBOutlet weak var outSitReachButton: UISegmentedControl!
    @IBOutlet weak var outTrunkLiftButton: UISegmentedControl!
    @IBOutlet weak var outArmShoulderButton: UISegmentedControl!
    //Button Actions
    @IBAction func btnSitReachButton(sender: AnyObject) {
        
        if outSitReachButton.selectedSegmentIndex == 1 {
            txtSitReach.becomeFirstResponder()
        }
        else {
            segueID = "showSitReach"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show history")
        }
        
    }
    @IBAction func btnTrunkLiftButton(sender: AnyObject) {
        
        if outTrunkLiftButton.selectedSegmentIndex == 1 {
            txtTrunkLift.becomeFirstResponder()
        }
        else {
            segueID = "showTrunkLift"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show history")
        }
        
    }
    @IBAction func btnArmShoulderButton(sender: AnyObject) {
        
        if outArmShoulderButton.selectedSegmentIndex == 1 {
            txtArmShoulder.becomeFirstResponder()
        }
        else {
            segueID = "showArmShoulder"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show history")
        }
        
    }
    
    var totalValuesToPass: [Int] = []
    
    var segueID = String()
    
    let doneSitReachButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(FlexibilityUITableViewController.doneSitReach))
    
    let doneTrunkLiftButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(FlexibilityUITableViewController.doneTrunkLift))
    
    let doneArmShoulderButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(FlexibilityUITableViewController.doneArmShoulder))

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        textField.tintColor = UIColor .clearColor()
        
        if textField == txtSitReach {
            
            txtSitReach.text = ""
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(FlexibilityUITableViewController.cancelSitReach))
            
            toolBar.setItems([cancelButton, spaceButton, doneSitReachButton], animated: false)
            doneSitReachButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            
            txtSitReach.keyboardType = UIKeyboardType.NumberPad
            txtSitReach.inputAccessoryView = toolBar
            
            txtSitReach.addTarget(self, action: #selector(textDidChange), forControlEvents: .EditingChanged)
            
        }
        else if textField == txtTrunkLift {
            
            txtTrunkLift.text = ""
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(FlexibilityUITableViewController.cancelTrunkLift))
            
            toolBar.setItems([cancelButton, spaceButton, doneTrunkLiftButton], animated: false)
            doneTrunkLiftButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            
            txtTrunkLift.keyboardType = UIKeyboardType.NumberPad
            txtTrunkLift.inputAccessoryView = toolBar
           
            txtTrunkLift.addTarget(self, action: #selector(textDidChange), forControlEvents: .EditingChanged)
            
        }
        else if textField == txtArmShoulder {
            
            txtArmShoulder.text = ""
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(FlexibilityUITableViewController.cancelArmShoulder))
            
            toolBar.setItems([cancelButton, spaceButton, doneArmShoulderButton], animated: false)
            doneArmShoulderButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            
            txtArmShoulder.keyboardType = UIKeyboardType.NumberPad
            txtArmShoulder.inputAccessoryView = toolBar
            
            txtArmShoulder.addTarget(self, action: #selector(textDidChange), forControlEvents: .EditingChanged)
            
        }

        
        
    }
    
    func textDidChange(textField: UITextField) {
        
        if textField == txtSitReach {
            
            doneSitReachButton.enabled = !txtSitReach.text!.isEmpty
        }
        else if textField == txtTrunkLift {
            
            doneTrunkLiftButton.enabled = !txtTrunkLift.text!.isEmpty
        }
        else if textField == txtArmShoulder {
            
            doneArmShoulderButton.enabled = !txtArmShoulder.text!.isEmpty
        }
        
    }
    
    
    func doneSitReach() {
        
        txtSitReach.resignFirstResponder()
        
        let centimeters = Int(txtSitReach.text!)
        
        WebApiConnector.Post("SitAndReachApi", data: ["sitAndReach":centimeters!]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(centimeters!) cm", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
        txtSitReach.text = ""
        
    }
    
    func cancelSitReach() {
        
        txtSitReach.text = ""
        
        txtSitReach.resignFirstResponder()
        
    }
    
    func doneTrunkLift() {
        
        txtTrunkLift.resignFirstResponder()
        
        let inches = Int(txtTrunkLift.text!)
        
        WebApiConnector.Post("TrunkLiftApi", data: ["trunkLift":inches!]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(inches!) in", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
        txtTrunkLift.text = ""
        
    }
    
    func cancelTrunkLift() {
        
        txtTrunkLift.text = ""
        
        txtTrunkLift.resignFirstResponder()
    }
    
    func doneArmShoulder() {
        
        txtArmShoulder.resignFirstResponder()
        
        let inches = Int(txtArmShoulder.text!)
        
        WebApiConnector.Post("ArmAndShoulderApi", data: ["armAndShoulder":inches!]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(inches!) in", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }

        txtArmShoulder.text = ""

    }
    
    func cancelArmShoulder() {
        
        txtArmShoulder.text = ""
        
        txtArmShoulder.resignFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let navVC = segue.destinationViewController as! UINavigationController
        
        let tableVC = navVC.viewControllers.first as! ReuseableHistoryTableViewController
        var TimeToPass: [String] = []
        var IDToPass: [Int] = []
        var TimeArray: [AnyObject]? = []
        var IDArray: [AnyObject]? = []
        var arrayToPass: [String] = []
        var JSONDictToArrayResult: [AnyObject]? = []
        switch segueID {
            
        case "showSitReach":
            
            _ = WebApiConnector.Get("SitAndReachApi") {
                (json: [[String:AnyObject]]?) -> Void in
                JSONDictToArrayResult = JSONParser.DictionaryToArray("sitAndReach", dict: json!)
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                arrayToPass = JSONDictToArrayResult!.map({"\($0) cm"})
                tableVC.totalValuesDest = arrayToPass
                tableVC.apiURL = "SitAndReachApi"
                tableVC.connectionView.reloadData()
            }
            
        case "showTrunkLift":
            _ = WebApiConnector.Get("TrunkLiftApi") {
                (json: [[String:AnyObject]]?) -> Void in
                JSONDictToArrayResult = JSONParser.DictionaryToArray("trunkLift", dict: json!)
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                arrayToPass = JSONDictToArrayResult!.map({"\($0) in"})
                tableVC.totalValuesDest = arrayToPass
                tableVC.apiURL = "TrunkLiftApi"
                tableVC.connectionView.reloadData()
            }
            
        case "showArmShoulder":
            _ = WebApiConnector.Get("ArmAndShoulderApi") {
                (json: [[String:AnyObject]]?) -> Void in
                JSONDictToArrayResult = JSONParser.DictionaryToArray("armAndShoulder", dict: json!)
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                arrayToPass = JSONDictToArrayResult!.map({"\($0) in"})
                tableVC.totalValuesDest = arrayToPass
                tableVC.apiURL = "ArmAndShoulderApi"
                tableVC.connectionView.reloadData()
            }
            
        default:
            arrayToPass = []
            tableVC.totalValuesDest = arrayToPass
        }
        
    }

    
}
