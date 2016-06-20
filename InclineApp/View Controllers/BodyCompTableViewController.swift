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
            performSegueWithIdentifier("showHeightHistory", sender: totalHeightValues)
            print("show history")
        }
        
    }
    
    @IBAction func btnWeightButton(sender: AnyObject) {
        
        if outWeightButton.selectedSegmentIndex == 1 {
            txtWeight.becomeFirstResponder()
        }
        else {
            performSegueWithIdentifier("showWeightHistory", sender: totalHeightValues)
            print("show history")
        }

    }
    
    @IBAction func btnBodyFatButton(sender: AnyObject) {
        
        if outBodyFatButton.selectedSegmentIndex == 1 {
            txtBodyFat.becomeFirstResponder()
        }
        else {
            performSegueWithIdentifier("showBodyFatHistory", sender: totalHeightValues)
            print("show history")
        }
    }
    
    
    //Setup and Initalize Arrays and Variables needed
    
    var feet: [String] = []
    var inches: [String] = []
    var heightValues: [[String]] = []
    
    var item1 = String()
    var item2 = String()
    
    var totalHeightValues: [Int] = []
    var totalWeightValues: [Int] = []
    var totalBodyFatValues: [Int] = []
    
    
    
    //View did load shit here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...12 {
            
            feet.append(String (format: "%d ft ",i))
            
        }
        
        for i in 0...11 {
            
            inches.append(String (format: "%d in ",i))
        }
        
        heightValues = [feet,inches]

        //let response = WebApiConnector.Get(ApplicationData.baseApiAddress + "WeightApi")
        //print(response)
        /*WebApiConnector.GET(ApplicationData.baseApiAddress + "WeightApi", parent: self) {
            (task:NSURLSessionDataTask, response:AnyObject?) -> Void in
                if response != nil {
                    let resp = "\(response!)".stringByReplacingOccurrencesOfString("(", withString: "[").stringByReplacingOccurrencesOfString(")", withString: "]")
                    print(resp)
                    var thing = JSONParser.Parse("\(resp)")
                    print(thing)
                }
        }*/


        //for json in requestThing! {
        //    things?.append(json["height"]!)
        //}
        //print(requestThing)
        //print(things)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Textfield Delegate methods here
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        textField.tintColor = UIColor .clearColor()
        
        if textField == txtHeight {
            
            let heightPicker: UIPickerView = UIPickerView()
            
            heightPicker.delegate = self
            heightPicker.dataSource = self
            heightPicker.showsSelectionIndicator = true
            heightPicker.backgroundColor = UIColor .whiteColor()
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BodyCompTableViewController.donePicker))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BodyCompTableViewController.cancelPicker))
            
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.userInteractionEnabled = true
            
            txtHeight.inputView = heightPicker
            txtHeight.inputAccessoryView = toolBar
            
            
        }
        else if textField == txtWeight {
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BodyCompTableViewController.doneWeight))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BodyCompTableViewController.cancelWeight))
            
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.userInteractionEnabled = true
            
            txtWeight.inputAccessoryView = toolBar

        }
        else if textField == txtBodyFat {
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.Default
            toolBar.translucent = true
            toolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BodyCompTableViewController.doneBodyFat))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BodyCompTableViewController.cancelBodyFat))
            
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.userInteractionEnabled = true
            
            txtBodyFat.inputAccessoryView = toolBar
        }
        
    }
    
    //Height Done Method
    
    func donePicker() {
        
        txtHeight.resignFirstResponder()
        
        var feet = Int(item1.componentsSeparatedByString(" ")[0])!
        let inches = Int(item2.componentsSeparatedByString(" ")[0])!
        
        feet *= 12
        
        let totalInches = feet + inches
        
        totalHeightValues.append(totalInches)
        
        print(totalHeightValues)
        
        txtHeight.text = ""
        
        let alertController = UIAlertController(title: "\(feet / 12) ft" + " " + "\(inches) in", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    //Height Cancel Method
    
    func cancelPicker() {
        
        txtHeight.text = ""
        
        txtHeight.resignFirstResponder()
        
    }

    //Weight Done Method
    
    func doneWeight() {
        
        txtWeight.resignFirstResponder()
        
        let pounds = Int(txtWeight.text!)
        
        
        totalWeightValues.append(pounds!)
        
        print(totalWeightValues)
        
        txtWeight.text = ""
        
        let alertController = UIAlertController(title: "\(pounds!) lbs", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    //Weight Cancel Method
    
    func cancelWeight() {
        
        txtWeight.resignFirstResponder()
        
        txtHeight.text = ""
    }
    
    //BodyFat Done Method
    
    func doneBodyFat() {
        
        txtBodyFat.resignFirstResponder()
        
        let bodyFat = Int(txtBodyFat.text!)
        
        totalBodyFatValues.append(bodyFat!)
        
        print(totalBodyFatValues)
        
        txtBodyFat.text = ""
        
        let alertController = UIAlertController(title: "\(bodyFat!) %", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
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
        
        item1 = heightValues[0][pickerView.selectedRowInComponent(0)]
        item2 = heightValues[1][pickerView.selectedRowInComponent(1)]
        
        txtHeight.text = item1 + item2
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let navVC = segue.destinationViewController as! UINavigationController
        
        let tableVC = navVC.viewControllers.first as! ReuseableHistoryTableViewController
        
        var arrayToPass: [String] = []
        switch segue.identifier! {
        case "showHeightHistory":
            //let requestThing = WebApiConnector.Get("HeightApi")
            arrayToPass = totalHeightValues.map({"\(($0 / 12)) ft \(($0 % 12)) in"})
            tableVC.totalValuesDest = arrayToPass
        case "showWeightHistory":
            var things : [AnyObject]? = []
            let requestThing = WebApiConnector.Get("WeightApi") {
                (json: [[String:AnyObject]]?) -> Void in
                print(json!)
                for jsonRes in json! {
                    print(jsonRes["weight"])
                    things?.append(jsonRes["weight"]!)
                }
                print(things!.map({$0 as! Int}))
                arrayToPass = things!.map({"\($0) lbs"})
                tableVC.totalValuesDest = arrayToPass
            }

        case "showBodyFatHistory":
            arrayToPass = totalBodyFatValues.map({"\($0) %"})
            tableVC.totalValuesDest = arrayToPass
        default:
            arrayToPass = []
            tableVC.totalValuesDest = arrayToPass
        }
        


        
    }
    
}
