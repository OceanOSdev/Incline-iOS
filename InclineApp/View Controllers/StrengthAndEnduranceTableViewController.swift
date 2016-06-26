//
//  StrengthAndEnduranceTableViewController.swift
//  Incline
//
//  Created by Jake Schroeder on 6/24/16.
//  Copyright © 2016 Incline. All rights reserved.
//

import UIKit

class StrengthAndEnduranceTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //TextField Outlets
    @IBOutlet weak var txtMaxBench: UITextField!
    @IBOutlet weak var txtMaxLegPress: UITextField!
    @IBOutlet weak var txtPullUps: UITextField!
    @IBOutlet weak var txtFlexedArmHang: UITextField!
    @IBOutlet weak var txtRightAnglePushUps: UITextField!
    @IBOutlet weak var txtCurlUps: UITextField!
    //Button Outlets
    @IBOutlet weak var outMaxBenchButton: UISegmentedControl!
    @IBOutlet weak var outMaxLegPressButton: UISegmentedControl!
    @IBOutlet weak var outPullUpsButton: UISegmentedControl!
    @IBOutlet weak var outFlexedArmHangButton: UISegmentedControl!
    @IBOutlet weak var outRightAnglePushUpsButton: UISegmentedControl!
    @IBOutlet weak var outCurlUpsButton: UISegmentedControl!
    
    //Button Actions
    @IBAction func btnMaxBechButton(sender: AnyObject) {
        
        if outMaxBenchButton.selectedSegmentIndex == 1 {
            txtMaxBench.becomeFirstResponder()
        }
        else {
            segueID = "showMaxBench"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show history")
        }
    }
    @IBAction func btnMaxLegPressButton(sender: AnyObject) {
        
        if outMaxLegPressButton.selectedSegmentIndex == 1 {
            txtMaxLegPress.becomeFirstResponder()
        }
        else {
            segueID = "showMaxLegPress"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show history")
        }
    }
    @IBAction func btnPullUpsButton(sender: AnyObject) {
        
        if outPullUpsButton.selectedSegmentIndex == 1 {
            txtPullUps.becomeFirstResponder()
        }
        else {
            segueID = "showPullUps"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show history")
        }
    }
    @IBAction func btnFlexedArmHangButton(sender: AnyObject) {
        
        if outFlexedArmHangButton.selectedSegmentIndex == 1 {
            txtFlexedArmHang.becomeFirstResponder()
        }
        else {
            segueID = "showFlexedArmHang"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show history")
        }
    }
    @IBAction func btnRightAnglePushUpsButton(sender: AnyObject) {
        
        if outRightAnglePushUpsButton.selectedSegmentIndex == 1 {
            txtRightAnglePushUps.becomeFirstResponder()
        }
        else {
            segueID = "showRightAnglePushUps"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show history")
        }
    }
    @IBAction func btnCurlUpsButton(sender: AnyObject) {
        
        if outCurlUpsButton.selectedSegmentIndex == 1 {
            txtCurlUps.becomeFirstResponder()
        }
        else {
            segueID = "showCurlUps"
            performSegueWithIdentifier("showHistory", sender: totalValuesToPass)
            print("show history")
        }
    }
    
    var totalValuesToPass: [Int] = []
    
    var segueID = String()
    
    var minutes: [String] = []
    var seconds: [String] = []
    var timeValues: [[String]] = []
    
    
    var item1 = String()
    var item2 = String()
    
    //Add buttons for UIPickerViews
    var doneFlexedArmHangButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(StrengthAndEnduranceTableViewController.doneFlexedArmHang))
    
    let doneMaxBenchButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(StrengthAndEnduranceTableViewController.doneMaxBench))
    
    let doneMaxLegPressButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(StrengthAndEnduranceTableViewController.doneMaxLegPress))
    
    let donePullUpsButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(StrengthAndEnduranceTableViewController.donePullUps))
    
    let doneRightAnglePushUpsButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(StrengthAndEnduranceTableViewController.doneRightAnglePushUps))
    
    let doneCurlUpsButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: UIToolbar(), action: #selector(StrengthAndEnduranceTableViewController.doneCurlUps))
    
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
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        textField.tintColor = UIColor .clearColor()
        
        if textField == txtMaxBench {
            
            txtMaxBench.text = ""
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(StrengthAndEnduranceTableViewController.cancelMaxBench))
            
            toolBar.setItems([cancelButton, spaceButton, doneMaxBenchButton], animated: false)
            doneMaxBenchButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtMaxBench.keyboardType = UIKeyboardType.NumberPad
            txtMaxBench.inputAccessoryView = toolBar
            
            txtMaxBench.addTarget(self, action: #selector(textDidChange), forControlEvents: .EditingChanged)
            
            
        }
            
        else if textField == txtMaxLegPress {
            
            txtMaxLegPress.text = ""
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(StrengthAndEnduranceTableViewController.cancelMaxLegPress))
            
            toolBar.setItems([cancelButton, spaceButton, doneMaxLegPressButton], animated: false)
            doneMaxLegPressButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtMaxLegPress.keyboardType = UIKeyboardType.NumberPad
            txtMaxLegPress.inputAccessoryView = toolBar
            
            txtMaxLegPress.addTarget(self, action: #selector(textDidChange), forControlEvents: .EditingChanged)
            
            
        }
            
        else if textField == txtPullUps {
            
            txtPullUps.text = ""
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(StrengthAndEnduranceTableViewController.cancelPullUps))
            
            toolBar.setItems([cancelButton, spaceButton, donePullUpsButton], animated: false)
            donePullUpsButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtPullUps.keyboardType = UIKeyboardType.NumberPad
            txtPullUps.inputAccessoryView = toolBar
            
            txtPullUps.addTarget(self, action: #selector(textDidChange), forControlEvents: .EditingChanged)
            
            
        }
        
        else if textField == txtFlexedArmHang {
            
            txtFlexedArmHang.text = ""
            
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
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(StrengthAndEnduranceTableViewController.cancelFlexedArmHang))
            
            toolBar.setItems([cancelButton, spaceButton, doneFlexedArmHangButton], animated: false)
            doneFlexedArmHangButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtFlexedArmHang.inputView = timePicker
            txtFlexedArmHang.inputAccessoryView = toolBar
            
        }
        
        else if textField == txtRightAnglePushUps {
            
            txtRightAnglePushUps.text = ""
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(StrengthAndEnduranceTableViewController.cancelRightAnglePushUps))
            
            toolBar.setItems([cancelButton, spaceButton, doneRightAnglePushUpsButton], animated: false)
            doneRightAnglePushUpsButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtRightAnglePushUps.keyboardType = UIKeyboardType.NumberPad
            txtRightAnglePushUps.inputAccessoryView = toolBar
            
            txtRightAnglePushUps.addTarget(self, action: #selector(textDidChange), forControlEvents: .EditingChanged)
            
            
        }

        else if textField == txtCurlUps {
            
            txtCurlUps.text = ""
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(StrengthAndEnduranceTableViewController.cancelCurlUps))
            
            toolBar.setItems([cancelButton, spaceButton, doneCurlUpsButton], animated: false)
            doneCurlUpsButton.enabled = false
            toolBar.userInteractionEnabled = true
            
            txtCurlUps.keyboardType = UIKeyboardType.NumberPad
            txtCurlUps.inputAccessoryView = toolBar
            
            txtCurlUps.addTarget(self, action: #selector(textDidChange), forControlEvents: .EditingChanged)
            
            
        }

        
    }
    
    func textDidChange(textField: UITextField) {
        
        if textField == txtMaxBench {
            
            doneMaxBenchButton.enabled = !txtMaxBench.text!.isEmpty
        }
        else if textField == txtMaxLegPress {
            
            doneMaxLegPressButton.enabled = !txtMaxLegPress.text!.isEmpty
        }
        else if textField == txtPullUps {
            
            donePullUpsButton.enabled = !txtPullUps.text!.isEmpty
        }
        else if textField == txtRightAnglePushUps {
            
            doneRightAnglePushUpsButton.enabled = !txtRightAnglePushUps.text!.isEmpty
        }
        else if textField == txtCurlUps {
            
            doneCurlUpsButton.enabled = !txtCurlUps.text!.isEmpty
        }
    }

    func doneMaxBench() {
        
        txtMaxBench.resignFirstResponder()
        
        let pounds = Int(txtMaxBench.text!)
        
        WebApiConnector.Post("MaxBenchApi", data: ["maxBench":pounds!]) {
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
        
        txtMaxBench.text = ""
    }
    
    func cancelMaxBench() {
        
        txtMaxBench.text = ""
        
        txtMaxBench.resignFirstResponder()
        
    }
    
    func doneMaxLegPress() {
        
        txtMaxLegPress.resignFirstResponder()
        
        let pounds = Int(txtMaxLegPress.text!)
        
        WebApiConnector.Post("MaxLegPressApi", data: ["maxLegPress":pounds!]) {
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
        
        txtMaxLegPress.text = ""
        
    }
    
    func cancelMaxLegPress() {
        
        txtMaxLegPress.text = ""
        
        txtMaxLegPress.resignFirstResponder()
        
    }
    
    func doneFlexedArmHang() {
        
        txtFlexedArmHang.resignFirstResponder()
        
        let time = "00:\(item1.componentsSeparatedByString(" ")[0]):\(item2.componentsSeparatedByString(" ")[0]).0000000"
        
        //(hours):(minutes):(seconds).(subseconds)
        
        WebApiConnector.Post("FlexedArmHangApi", data: ["flexedArmHang":time]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(self.item1)" + " " + "\(self.item2)", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
        txtFlexedArmHang.text = ""
    
    }
    
    func cancelFlexedArmHang() {
        
        txtFlexedArmHang.text = ""
        
        txtFlexedArmHang.resignFirstResponder()
        
    }
    
    func donePullUps() {
        
        txtPullUps.resignFirstResponder()
        
        let reps = Int(txtPullUps.text!)
        
        WebApiConnector.Post("PullUpApi", data: ["pullUps":reps!]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(reps!) reps", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
        txtPullUps.text = ""
        
    }
    
    func cancelPullUps() {
        
        txtPullUps.text = ""
        
        txtPullUps.resignFirstResponder()
    }
    
    func doneRightAnglePushUps() {
        
        txtRightAnglePushUps.resignFirstResponder()
        
        let reps = Int(txtRightAnglePushUps.text!)
        
        WebApiConnector.Post("RightAnglePushUpApi", data: ["rightAnglePushUps":reps!]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(reps!) reps", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
        txtRightAnglePushUps.text = ""
        
    }
    
    func cancelRightAnglePushUps() {
        
        txtRightAnglePushUps.text = ""
        
        txtRightAnglePushUps.resignFirstResponder()
        
    }
    
    func doneCurlUps() {
        
        txtCurlUps.resignFirstResponder()
        
        let reps = Int(txtCurlUps.text!)
        
        WebApiConnector.Post("CurlUpApi", data: ["curlUps":reps!]) {
            (dataTask: NSURLSessionDataTask, httpResponse: AnyObject?) -> Void in
            let urlResponse = dataTask.response as? NSHTTPURLResponse
            
            var alertController : UIAlertController
            
            if let _ = urlResponse {
                if urlResponse?.statusCode < 400 {
                    alertController = UIAlertController(title: "\(reps!) reps", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
                }
                else {
                    alertController = UIAlertController(title: "\(urlResponse?.statusCode) Error", message: "You could try logging in?", preferredStyle: UIAlertControllerStyle.Alert)
                }
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
        txtCurlUps.text = ""
        
    }
    
    func cancelCurlUps() {
        
        txtCurlUps.text = ""
        
        txtCurlUps.resignFirstResponder()

        
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
        
        doneFlexedArmHangButton.enabled = true
        
        item1 = timeValues[0][pickerView.selectedRowInComponent(0)]
        item2 = timeValues[1][pickerView.selectedRowInComponent(1)]
        
        txtFlexedArmHang.text = item1 + item2
        
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
            
        case "showMaxBench":
            
            _ = WebApiConnector.Get("MaxBenchApi") {
                (json: [[String:AnyObject]]?) -> Void in
                JSONDictToArrayResult = JSONParser.DictionaryToArray("maxBench", dict: json!)
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                arrayToPass = JSONDictToArrayResult!.map({"\($0) lbs"})
                tableVC.totalValuesDest = arrayToPass
                tableVC.connectionView.reloadData()
            }
            
        case "showMaxLegPress":
            _ = WebApiConnector.Get("MaxLegPressApi") {
                (json: [[String:AnyObject]]?) -> Void in
                JSONDictToArrayResult = JSONParser.DictionaryToArray("maxLegPress", dict: json!)
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                arrayToPass = JSONDictToArrayResult!.map({"\($0) lbs"})
                tableVC.totalValuesDest = arrayToPass
                tableVC.connectionView.reloadData()
            }

            
        case "showFlexedArmHang":
            // Creates the request
            _ = WebApiConnector.Get("FlexedArmHangApi") {
                (json: [[String:AnyObject]]?) -> Void in
                JSONDictToArrayResult = JSONParser.DictionaryToArray("flexedArmHang", dict: json!)
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                arrayToPass = JSONDictToArrayResult!.map({[$0.componentsSeparatedByString(":")[1],$0.componentsSeparatedByString(":")[2]]}).map({"\($0[0]) min \($0[1]) sec"})
                tableVC.totalValuesDest = arrayToPass
                tableVC.connectionView.reloadData()             }
            
        case "showPullUps":
            _ = WebApiConnector.Get("PullUpApi") {
                (json: [[String:AnyObject]]?) -> Void in
                JSONDictToArrayResult = JSONParser.DictionaryToArray("pullUps", dict: json!)
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                arrayToPass = JSONDictToArrayResult!.map({"\($0) reps"})
                tableVC.totalValuesDest = arrayToPass
                tableVC.connectionView.reloadData()
            }
            
        case "showRightAnglePushUps":
            _ = WebApiConnector.Get("RightAnglePushUpApi") {
                (json: [[String:AnyObject]]?) -> Void in
                JSONDictToArrayResult = JSONParser.DictionaryToArray("rightAnglePushUps", dict: json!)
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                arrayToPass = JSONDictToArrayResult!.map({"\($0) reps"})
                tableVC.totalValuesDest = arrayToPass
                tableVC.connectionView.reloadData()
            }
            
        case "showCurlUps":
            _ = WebApiConnector.Get("CurlUpApi") {
                (json: [[String:AnyObject]]?) -> Void in
                JSONDictToArrayResult = JSONParser.DictionaryToArray("curlUps", dict: json!)
                TimeArray = JSONParser.DictionaryToArray("logged", dict: json!)
                IDArray = JSONParser.DictionaryToArray("id", dict: json!)
                TimeToPass = JSONParser.getTimes(TimeArray)
                IDToPass = IDArray!.map({$0 as! Int})
                tableVC.idValuesDest = IDToPass
                tableVC.dateValuesDest = TimeToPass
                arrayToPass = JSONDictToArrayResult!.map({"\($0) reps"})
                tableVC.totalValuesDest = arrayToPass
                tableVC.connectionView.reloadData()
            }
            
        default:
            arrayToPass = []
            tableVC.totalValuesDest = arrayToPass
        }
        
    }


}
