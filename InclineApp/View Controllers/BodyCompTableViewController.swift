//
//  BodyCompTableViewController.swift
//  InclineApp(2ndIteration)
//
//  Created by Jake Schroeder on 6/1/16.
//  Copyright © 2016 Incline. All rights reserved.
//

import UIKit



class BodyCompTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //TextField Outlets
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtBodyFat: UITextField!
    
    //Button Outlets
    @IBOutlet weak var outHeightButton: UISegmentedControl!
    @IBOutlet weak var outWeightButton: UISegmentedControl!
    @IBOutlet weak var outBodyFatButton: UISegmentedControl!
    
    
    
    //Button Actions
    
    @IBAction func btnHeightButton(sender: AnyObject) {
        
        if outHeightButton.selectedSegmentIndex == 1 {
            txtHeight.becomeFirstResponder()
        }
        else {
            segueID = "showHeightHistory"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show height history")
        }
        
    }
    
    @IBAction func btnWeightButton(sender: AnyObject) {
        
        if outWeightButton.selectedSegmentIndex == 1 {
            txtWeight.becomeFirstResponder()
        }
        else {
            segueID = "showWeightHistory"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show weight history")
        }

    }
    
    @IBAction func btnBodyFatButton(sender: AnyObject) {
        
        if outBodyFatButton.selectedSegmentIndex == 1 {
            txtBodyFat.becomeFirstResponder()
        }
        else {
            segueID = "showBodyFatHistory"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show body fat history")
        }
    }
    
    
    //Setup and Initalize Arrays and Variables needed
    
    var feet: [String] = []
    var inches: [String] = []
    var heightValues: [[String]] = []
    
    var item1 = String()
    var item2 = String()
    
    var totalValuesToPass: [Int] = []
    //var totalWeightValues: [Int] = []
    //var totalBodyFatValues: [Int] = []
    
    var segueID = String()
    
    //Add button for UIPickerView
    var doneHeightButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(BodyCompTableViewController.doneHeightPicker))
    
    let doneWeightButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(BodyCompTableViewController.doneWeight))
    
    let doneBodyFatButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(BodyCompTableViewController.doneBodyFat))
    
    //Acticity Indicator
    
    //let activityView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)

    //View did load shit here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //activityView.color = UIColor.darkGrayColor()
        
        for i in 1...12 {
            
            feet.append(String (format: "%d ft ",i))
            
        }
        
        for i in 0...11 {
            
            inches.append(String (format: "%d in ",i))
        }
        
        heightValues = [feet,inches]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Textfield Delegate methods here
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        textField.tintColor = UIColor .clearColor()
        
        if textField == txtHeight {
            
            txtWeight.text = ""
            
            let heightPicker: UIPickerView = UIPickerView()
            
            heightPicker.delegate = self
            heightPicker.dataSource = self
            heightPicker.showsSelectionIndicator = true
            heightPicker.backgroundColor = UIColor .whiteColor()
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BodyCompTableViewController.cancelHeightPicker))
            
            toolBar.setItems([cancelButton, spaceButton, doneHeightButton], animated: false)
            doneHeightButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtHeight.inputView = heightPicker
            txtHeight.inputAccessoryView = toolBar
            
            
        }
        else if textField == txtWeight {
            
            txtWeight.text = ""
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BodyCompTableViewController.cancelWeight))
            
            toolBar.setItems([cancelButton, spaceButton, doneWeightButton], animated: false)
            doneWeightButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtWeight.keyboardType = UIKeyboardType.NumberPad
            txtWeight.inputAccessoryView = toolBar
            
            txtWeight.addTarget(self, action: #selector(textDidChange), forControlEvents: .EditingChanged)


        }
        else if textField == txtBodyFat {
            
            txtWeight.text = ""
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BodyCompTableViewController.cancelBodyFat))
            
            toolBar.setItems([cancelButton, spaceButton, doneBodyFatButton], animated: false)
            doneBodyFatButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtBodyFat.keyboardType = UIKeyboardType.NumberPad
            txtBodyFat.inputAccessoryView = toolBar
            
            txtBodyFat.addTarget(self, action: #selector(textDidChange), forControlEvents: .EditingChanged)

        }
        
    }
    
    
    
    func textDidChange(textField: UITextField) {
        
        if textField == txtWeight {
            
            doneWeightButton.enabled = !txtWeight.text!.isEmpty
        }
        else if textField == txtBodyFat {
            
            doneBodyFatButton.enabled = !txtBodyFat.text!.isEmpty
        }
        
    }

    
    //Height Done Method
    
    func doneHeightPicker() {
        
        txtHeight.resignFirstResponder()
        
        let act = ActivityHelper(parentView: self)
        
        var feet = Int(item1.componentsSeparatedByString(" ")[0])!
        let inches = Int(item2.componentsSeparatedByString(" ")[0])!
        
        feet *= 12
        
        let totalInches = feet + inches
        
        //totalHeightValues.append(totalInches)
        
        //print(totalHeightValues)

        WebApiConnector.Post("HeightApi", data: ["height":totalInches]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse

            var alertController : UIAlertController

            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(feet / 12) ft" + " " + "\(inches) in", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }

                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                act.stopActivityIndicator()

                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
        txtHeight.text = ""
    }
    
    //Height Cancel Method
    
    func cancelHeightPicker() {
        
        txtHeight.text = ""
        
        txtHeight.resignFirstResponder()
        
    }

    //Weight Done Method
    
    func doneWeight() {
        
        txtWeight.resignFirstResponder()
        
        let pounds = Int(txtWeight.text!)
        
        WebApiConnector.Post("WeightApi", data: ["weight":pounds!]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(pounds!) lbs", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
        txtWeight.text = ""
    }
    
    //Weight Cancel Method
    
    func cancelWeight() {
        
        txtWeight.text = ""
        
        txtWeight.resignFirstResponder()
        
    }
    
    //BodyFat Done Method
    
    func doneBodyFat() {
        
        txtBodyFat.resignFirstResponder()
        
        let bodyFat = Int(txtBodyFat.text!)
        
        WebApiConnector.Post("PercentBodyFatApi", data: ["bodyFat":bodyFat!]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(bodyFat!) %", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
        txtBodyFat.text = ""
    }
    
    //BodyFat Cancel Method
    
    func cancelBodyFat() {
        
        txtBodyFat.resignFirstResponder()
        
        txtBodyFat.text = ""
    }
    
    //UIPickerView Delegate methods here
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        return heightValues[component].count
    }
    
    //UIPickerView Datasource methods here
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return heightValues[component] [row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        doneHeightButton.enabled = true
        
        item1 = heightValues[0][pickerView.selectedRowInComponent(0)]
        item2 = heightValues[1][pickerView.selectedRowInComponent(1)]
        
        txtHeight.text = item1 + item2
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let navVC = segue.destinationViewController as! UINavigationController
        
        let tableVC = navVC.viewControllers.first as! ReuseableHistoryTableViewController
        
        var arrayToPass: [String] = []
        var TimeToPass: [String] = []
        var IDToPass: [Int] = []
        var JSONDictToArrayResult: [AnyObject]? = []
        var TimeArray: [AnyObject]? = []
        var IDArray: [AnyObject]? = []
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT

        switch segueID {
        case "showHeightHistory":
            // Creates the request
            _ = WebApiConnector.Get("HeightApi") {
                (json: [[String:AnyObject]]?) -> Void in
                
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    // do some task
                    JSONDictToArrayResult = JSONParser.DictionaryToArray("height", dict: json!) // extract only the values with the key "height" and put them into an array.
                    TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                    IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                    TimeToPass = JSONParser.getTimes(TimeArray)
                    IDToPass = IDArray!.map({$0 as! Int})
                    tableVC.idValuesDest = IDToPass
                    tableVC.dateValuesDest = TimeToPass
                    arrayToPass = JSONDictToArrayResult!.map({$0 as! Int}).map({"\(($0 / 12)) ft \(($0 % 12)) in"}) // cast the results to ints and then cast that those to strings containing height in feet and inches.
                    tableVC.totalValuesDest = arrayToPass  // send the array of strings over to the reusable table history view controller
                    tableVC.apiURL = "HeightApi" // send the api url so that the Reusable History Table Controller knows what to delete if it needs to
                    dispatch_async(dispatch_get_main_queue()) {
                        // update some UI
                        tableVC.activityView.stopAnimating()
                        tableVC.connectionView.reloadData()  // reload the table data when the web request completes.
                    }
                }
                //tableVC.connectionView.reloadData()  // reload the table data when the web request completes.
            }

        case "showWeightHistory":

            _ = WebApiConnector.Get("WeightApi") {
                (json: [[String:AnyObject]]?) -> Void in
                
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                JSONDictToArrayResult = JSONParser.DictionaryToArray("weight", dict: json!)
                    TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                    IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                    arrayToPass = JSONDictToArrayResult!.map({"\($0) lbs"})
                    TimeToPass = JSONParser.getTimes(TimeArray)
                
                    IDToPass = IDArray!.map({$0 as! Int})
                    tableVC.idValuesDest = IDToPass
                    tableVC.dateValuesDest = TimeToPass
                    tableVC.totalValuesDest = arrayToPass
                    tableVC.apiURL = "WeightApi"
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        tableVC.activityView.stopAnimating()
                        tableVC.connectionView.reloadData()
                    }
                }
            }

        case "showBodyFatHistory":
            _ = WebApiConnector.Get("PercentBodyFatApi") {
                (json: [[String:AnyObject]]?) -> Void in
                    JSONDictToArrayResult = JSONParser.DictionaryToArray("bodyFat", dict: json!)
                    TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                    IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                    TimeToPass = JSONParser.getTimes(TimeArray)
                    IDToPass = IDArray!.map({$0 as! Int})
                    tableVC.idValuesDest = IDToPass
                    tableVC.dateValuesDest = TimeToPass
                    arrayToPass = JSONDictToArrayResult!.map({"\($0) %"})
                    tableVC.totalValuesDest = arrayToPass
                    tableVC.apiURL = "PercentBodyFatApi"
                    tableVC.connectionView.reloadData()
            }

        default:
            arrayToPass = []
            tableVC.totalValuesDest = arrayToPass
        }
        


        
    }
    
}
