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
            print("show History")
        }
        
    }
    
    @IBAction func btnHalfMileRun(sender: AnyObject) {
    }
    
    @IBAction func btnPacer(sender: AnyObject) {
    }
    
    @IBAction func btnStepTest(sender: AnyObject) {
    }
    
    @IBAction func btnHeartStepTest(sender: AnyObject) {
    }
    
    //Setup and Initalize Arrays and Variables needed
    
    var minutes: [String] = []
    var seconds: [String] = []
    var timeValues: [[String]] = []
    
    
    var mileRunItem1 = String()
    var mileRunItem2 = String()
    
    var halfmileRunItem1 = String()
    var halfmileRunItem2 = String()
    
    var totalTimeValue: [Int] = []
    
    //View did load shit here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...22 {
            
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
            
            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CardioTableViewController.doneMileRun))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CardioTableViewController.cancelMileRun))
            
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
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
            
            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CardioTableViewController.doneHalfMileRun))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CardioTableViewController.cancelHalfMileRun))
            
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.userInteractionEnabled = true
            
            txtHalfMileRun.inputView = timePicker
            txtHalfMileRun.inputAccessoryView = toolBar
        }
        
    }
    
    //Time Done Method

    func doneMileRun() {
        
        txtMileRun.resignFirstResponder()
        
        let minutes = Int(mileRunItem1.componentsSeparatedByString(" ")[0])!
        let seconds = Int(mileRunItem2.componentsSeparatedByString(" ")[0])!
        
        let alertController = UIAlertController(title: "\(minutes) min" + " " + "\(seconds) sec", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)

        
        let totalMinutes = (minutes * 60) + seconds
        
        totalTimeValue.append(totalMinutes)
        
        print(totalTimeValue)
        
        txtMileRun.text = ""
        
    }
    
    //Time Cancel Method
    
    func cancelMileRun() {
        
        txtMileRun.text = ""
        
        txtMileRun.resignFirstResponder()

        
    }
    
    //Time Done Method
    
    func doneHalfMileRun() {
        
    }
    
    //Time Cancel Method
    
    func cancelHalfMileRun() {
        
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
            
            mileRunItem1 = timeValues[0][pickerView.selectedRowInComponent(0)]
            mileRunItem2 = timeValues[1][pickerView.selectedRowInComponent(1)]
            
            txtMileRun.text = mileRunItem1 + mileRunItem2

        }
        else {
            
            halfmileRunItem1 = timeValues[0][pickerView.selectedRowInComponent(0)]
            halfmileRunItem2 = timeValues[1][pickerView.selectedRowInComponent(1)]
            
            txtHalfMileRun.text = halfmileRunItem1 + halfmileRunItem2
            
        }
        
        
    }

    
}
