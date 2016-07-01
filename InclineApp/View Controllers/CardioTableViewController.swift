//
//  CardioTableViewController.swift
//  InclineApp(2ndIteration)
//
//  Created by Jake Schroeder on 6/4/16.
//  Copyright © 2016 Incline. All rights reserved.
//

import UIKit

class CardioTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    //TextField Outlets
    
    @IBOutlet weak var txtMileRun: UITextField!
    @IBOutlet weak var txtHalfMileRun: UITextField!
    @IBOutlet weak var txtPacer: UITextField!
    @IBOutlet weak var txtStepTest: UITextField!
    @IBOutlet weak var txtHeartStepTest: UITextField!
    
    //Button Outlets
    
    @IBOutlet weak var outMileRunButton: UISegmentedControl!
    @IBOutlet weak var outHalfMileRunButton: UISegmentedControl!
    @IBOutlet weak var outPacerButton: UISegmentedControl!
    @IBOutlet weak var outStepTestButton: UISegmentedControl!
    @IBOutlet weak var outHeartStepTestButton: UISegmentedControl!
    
    //Button Actions
    
    @IBAction func btnMileRun(sender: AnyObject) {
        
        if outMileRunButton.selectedSegmentIndex == 1 {
            txtMileRun.becomeFirstResponder()
        }
        else {
            segueID = "showMileRun"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show History")
        }
        
    }
    
    @IBAction func btnHalfMileRun(sender: AnyObject) {
        
        if outHalfMileRunButton.selectedSegmentIndex == 1 {
            txtHalfMileRun.becomeFirstResponder()
        }
        else {
            segueID = "showHalfMileRun"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show History")
        }
    }
    
    @IBAction func btnPacer(sender: AnyObject) {
        
        if outPacerButton.selectedSegmentIndex == 1 {
            txtPacer.becomeFirstResponder()
        }
        else {
            segueID = "showPacer"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show History")
        }
    }
    
    @IBAction func btnStepTest(sender: AnyObject) {
        
        if outStepTestButton.selectedSegmentIndex == 1 {
            txtStepTest.becomeFirstResponder()
        }
        else {
            segueID = "showStepTest"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show History")
        }
    }
    
    @IBAction func btnHeartStepTest(sender: AnyObject) {
        
        if outHeartStepTestButton.selectedSegmentIndex == 1 {
            txtHeartStepTest.becomeFirstResponder()
        }
        else {
            segueID = "showHeartStepTest"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show History")
        }
    }
    
    //Setup and Initalize Arrays and Variables needed
    
    var minutes: [String] = []
    var seconds: [String] = []
    var timeValues: [[String]] = []
    
    
    var mileRunItem1 = String()
    var mileRunItem2 = String()
    
    var halfmileRunItem1 = String()
    var halfmileRunItem2 = String()
    
    var totalValuesToPass: [Int] = []
    
    
    var segueID = String()
    
    let doneMileRunButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(CardioTableViewController.doneMileRun))
    
    let doneHalfMileButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(CardioTableViewController.doneHalfMileRun))
    
    let donePacerButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(CardioTableViewController.donePacer))
    
    let doneStepsButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(CardioTableViewController.doneSteps))

    let doneHeartButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(CardioTableViewController.doneHeart))

    //View did load shit here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...59 {
            
            minutes.append(String (format: "%d min ",i))
            
        }
        
        for i in 0...59 {
            
            seconds.append(String (format: "%d sec ",i))
        }
        
        timeValues = [minutes,seconds]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    //TextField Delegate Methods
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        textField.tintColor = UIColor .clearColor()
        
        if textField == txtMileRun {
            
            let timePicker: UIPickerView = UIPickerView()
            
            timePicker.delegate = self
            timePicker.dataSource = self
            timePicker.tag = 1
            timePicker.showsSelectionIndicator = true
            timePicker.backgroundColor = UIColor .whiteColor()
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CardioTableViewController.cancelMileRun))
            
            toolBar.setItems([cancelButton, spaceButton, doneMileRunButton], animated: false)
            doneMileRunButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtMileRun.inputView = timePicker
            txtMileRun.inputAccessoryView = toolBar
            
        }
        else if textField == txtHalfMileRun {
            
            let timePicker: UIPickerView = UIPickerView()
            
            timePicker.delegate = self
            timePicker.dataSource = self
            timePicker.tag = 2
            timePicker.showsSelectionIndicator = true
            timePicker.backgroundColor = UIColor .whiteColor()
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CardioTableViewController.cancelHalfMileRun))
            
            toolBar.setItems([cancelButton, spaceButton, doneHalfMileButton], animated: false)
            doneHalfMileButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtHalfMileRun.inputView = timePicker
            txtHalfMileRun.inputAccessoryView = toolBar
        }
        else if textField == txtPacer {
            
            txtPacer.text = ""
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CardioTableViewController.cancelPacer))
            
            toolBar.setItems([cancelButton, spaceButton, donePacerButton], animated: false)
            donePacerButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtPacer.keyboardType = UIKeyboardType.NumberPad
            txtPacer.inputAccessoryView = toolBar
            
            txtPacer.addTarget(self, action: #selector(textDidChange), forControlEvents: .EditingChanged)

        }
        else if textField == txtStepTest {
            
            txtStepTest.text = ""
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CardioTableViewController.cancelSteps))
            
            toolBar.setItems([cancelButton, spaceButton, doneStepsButton], animated: false)
            doneStepsButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtStepTest.keyboardType = UIKeyboardType.NumberPad
            txtStepTest.inputAccessoryView = toolBar
            
            txtStepTest.addTarget(self, action: #selector(textDidChange), forControlEvents: .EditingChanged)

        }
        else if textField == txtHeartStepTest {
            
            txtHeartStepTest.text = ""
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CardioTableViewController.cancelHeart))
            
            toolBar.setItems([cancelButton, spaceButton, doneHeartButton], animated: false)
            doneHeartButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtHeartStepTest.keyboardType = UIKeyboardType.NumberPad
            txtHeartStepTest.inputAccessoryView = toolBar
            
            txtHeartStepTest.addTarget(self, action: #selector(textDidChange), forControlEvents: .EditingChanged)

        }
    }
    
    //TextField text inside changed delegate method
    
    func textDidChange(textField: UITextField) {
        
        if textField == txtPacer {
            
            donePacerButton.enabled = !txtPacer.text!.isEmpty
        }
        else if textField == txtStepTest {
            
            doneStepsButton.enabled = !txtStepTest.text!.isEmpty
        }
        else if textField == txtHeartStepTest {
            
            doneHeartButton.enabled = !txtHeartStepTest.text!.isEmpty
        }
        
    }
    
    
    //Time Done Method

    func doneMileRun() {
        
        txtMileRun.resignFirstResponder()
        
        let act = ActivityHelper(parentView: self)
        
        let time = "00:\(mileRunItem1.componentsSeparatedByString(" ")[0]):\(mileRunItem2.componentsSeparatedByString(" ")[0]).0000000"
        
        //(hours):(minutes):(seconds).(subseconds)
        
        WebApiConnector.Post("MileTimeApi", data: ["mileTime":time]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(self.mileRunItem1)" + " " + "\(self.mileRunItem2)", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                act.stopActivityIndicator()
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }

        txtMileRun.text = ""
        
    }
    
    //Time Cancel Method
    
    func cancelMileRun() {
        
        txtMileRun.text = ""
        
        txtMileRun.resignFirstResponder()
        
    }
    
    //Time Done Method
    
    func doneHalfMileRun() {
        
        txtHalfMileRun.resignFirstResponder()
        
        let act = ActivityHelper(parentView: self)

        let minutes = Int(halfmileRunItem1.componentsSeparatedByString(" ")[0])!
        let seconds = Int(halfmileRunItem2.componentsSeparatedByString(" ")[0])!
        
        let time = "00:\(halfmileRunItem1.componentsSeparatedByString(" ")[0]):\(halfmileRunItem2.componentsSeparatedByString(" ")[0]).0000000"

        WebApiConnector.Post("HalfMileTimeApi", data: ["halfMileTime":time]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(minutes) min" + " " + "\(seconds) sec", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                act.stopActivityIndicator()

                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
        txtHalfMileRun.text = ""
        
    }
    
    //Time Cancel Method
    
    func cancelHalfMileRun() {
        
        txtHalfMileRun.text = ""
        
        txtHalfMileRun.resignFirstResponder()
        
    }
    
    func donePacer() {
        
        txtPacer.resignFirstResponder()
        
        let act = ActivityHelper(parentView: self)

        let laps = Int(txtPacer.text!)
        
        WebApiConnector.Post("PacerApi", data: ["pacer":laps!]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(laps!) laps", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                act.stopActivityIndicator()

                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }

        
        txtPacer.text = ""
        
    }
    
    func cancelPacer() {
        
        txtPacer.text = ""
        
        txtPacer.resignFirstResponder()
        
    }
    
    func doneSteps() {
        
        txtStepTest.resignFirstResponder()
        
        let act = ActivityHelper(parentView: self)

        let steps = Int(txtStepTest.text!)
        
        WebApiConnector.Post("StepTestApi", data: ["stepTestSteps":steps!]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(steps!) steps", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                act.stopActivityIndicator()

                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
        txtStepTest.text = ""
        
    }
    
    func cancelSteps() {
        
        txtStepTest.text = ""
        
        txtStepTest.resignFirstResponder()
    }
    
    func doneHeart() {
        
        txtHeartStepTest.resignFirstResponder()
        
        let act = ActivityHelper(parentView: self)

        let bpm = Int(txtHeartStepTest.text!)
        
        WebApiConnector.Post("StepTestApi", data: ["stepTestHeartRate":bpm!]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(bpm!) bpm", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                act.stopActivityIndicator()

                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
        txtHeartStepTest.text = ""
    }
    
    func cancelHeart() {
        
        txtHeartStepTest.text = ""
        
        txtHeartStepTest.resignFirstResponder()
        
    }
    
    //UIPickerView Delegate methods here
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return timeValues[component].count
    }
    
    //UIPickerView Datasource methods here
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return timeValues[component] [row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            
            doneMileRunButton.enabled = true
            
            mileRunItem1 = timeValues[0][pickerView.selectedRowInComponent(0)]
            mileRunItem2 = timeValues[1][pickerView.selectedRowInComponent(1)]
            
            txtMileRun.text = mileRunItem1 + mileRunItem2

        }
        else {
            
            doneHalfMileButton.enabled = true
            
            halfmileRunItem1 = timeValues[0][pickerView.selectedRowInComponent(0)]
            halfmileRunItem2 = timeValues[1][pickerView.selectedRowInComponent(1)]
            
            txtHalfMileRun.text = halfmileRunItem1 + halfmileRunItem2
            
        }
        
        
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
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT

        switch segueID {
            
        case "showMileRun":
            // Creates the request
            _ = WebApiConnector.Get("MileTimeApi") {
                (json: [[String:AnyObject]]?) -> Void in
                
                dispatch_async(dispatch_get_global_queue(priority, 0)) {

                JSONDictToArrayResult = JSONParser.DictionaryToArray("mileTime", dict: json!)
                arrayToPass = JSONDictToArrayResult!.map({[$0.componentsSeparatedByString(":")[1],$0.componentsSeparatedByString(":")[2]]}).map({"\($0[0]) min \($0[1]) sec"})
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                tableVC.totalValuesDest = arrayToPass
                tableVC.apiURL = "MileTimeApi"
                    dispatch_async(dispatch_get_main_queue()) {
                        tableVC.connectionView.reloadData()
                    }
                }
            }
            
        case "showHalfMileRun":
            _ = WebApiConnector.Get("HalfMileTimeApi") {
                (json: [[String:AnyObject]]?) -> Void in
                
                dispatch_async(dispatch_get_global_queue(priority, 0)) {

                JSONDictToArrayResult = JSONParser.DictionaryToArray("halfMileTime", dict: json!)
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                arrayToPass = JSONDictToArrayResult!.map({[$0.componentsSeparatedByString(":")[1],$0.componentsSeparatedByString(":")[2]]}).map({"\($0[0]) min \($0[1]) sec"})
                tableVC.totalValuesDest = arrayToPass
                tableVC.apiURL = "HalfMileTimeApi"
                    dispatch_async(dispatch_get_main_queue()) {
                        tableVC.connectionView.reloadData()
                    }
                }
            }
            
        case "showPacer":
            
            _ = WebApiConnector.Get("PacerApi") {
                (json: [[String:AnyObject]]?) -> Void in
                dispatch_async(dispatch_get_global_queue(priority, 0)) {

                JSONDictToArrayResult = JSONParser.DictionaryToArray("pacer", dict: json!)
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                arrayToPass = JSONDictToArrayResult!.map({"\($0) laps"})
                tableVC.totalValuesDest = arrayToPass
                tableVC.apiURL = "PacerApi"
                    dispatch_async(dispatch_get_main_queue()) {
                        tableVC.connectionView.reloadData()
                    }
                }
            }
            
        case "showStepTest":
            _ = WebApiConnector.Get("StepTestApi") {
                (json: [[String:AnyObject]]?) -> Void in
                dispatch_async(dispatch_get_global_queue(priority, 0)) {

                JSONDictToArrayResult = JSONParser.DictionaryToArray("stepTestSteps", dict: json!)
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                arrayToPass = JSONDictToArrayResult!.map({"\($0) steps"})
                tableVC.totalValuesDest = arrayToPass
                tableVC.apiURL = "StepTestApi"
                    dispatch_async(dispatch_get_main_queue()) {
                        tableVC.connectionView.reloadData()
                    }
                }
            }
            
        case "showHeartStepTest":
            _ = WebApiConnector.Get("StepTestApi") {
                (json: [[String:AnyObject]]?) -> Void in
                dispatch_async(dispatch_get_global_queue(priority, 0)) {

                JSONDictToArrayResult = JSONParser.DictionaryToArray("stepTestHeartRate", dict: json!)
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                arrayToPass = JSONDictToArrayResult!.map({"\($0) bpm"})
                tableVC.totalValuesDest = arrayToPass
                tableVC.apiURL = "StepTestApi"
                    dispatch_async(dispatch_get_main_queue()) {
                        tableVC.connectionView.reloadData()
                    }
                }
            }
            
        default:
            arrayToPass = []
            tableVC.totalValuesDest = arrayToPass
        }
        
    }
    
}
