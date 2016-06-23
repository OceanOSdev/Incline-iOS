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
            //performSegueWithIdentifier("showHeightHistory", sender: totalHeightValues)
            print("show height history")
        }
        
    }
    @IBAction func btnTrunkLiftButton(sender: AnyObject) {
        
        if outTrunkLiftButton.selectedSegmentIndex == 1 {
            txtTrunkLift.becomeFirstResponder()
        }
        else {
            //performSegueWithIdentifier("showHeightHistory", sender: totalHeightValues)
            print("show height history")
        }
        
    }
    @IBAction func btnArmShoulderButton(sender: AnyObject) {
        
        if outArmShoulderButton.selectedSegmentIndex == 1 {
            txtArmShoulder.becomeFirstResponder()
        }
        else {
            //performSegueWithIdentifier("showHeightHistory", sender: totalHeightValues)
            print("show height history")
        }
        
    }
    
    var totalSitReachValues: [Int] = []
    var totalTrunkLiftValues: [Int] = []
    var totalArmShoulderValues: [Int] = []
    
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
            
        }

        
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if textField == txtSitReach {
            
            if txtSitReach.text?.isEmpty == true {
            
                doneSitReachButton.enabled = false
            }
            else {
                doneSitReachButton.enabled = true
            }
        }
        else if textField == txtTrunkLift {
            
            doneTrunkLiftButton.enabled = true
        }
        else if textField == txtArmShoulder {
            doneArmShoulderButton.enabled = true
        }
        
        return true
    }

    
    
    func doneSitReach() {
        
        txtSitReach.resignFirstResponder()
        
        let centimeters = Int(txtSitReach.text!)
        
        
        totalSitReachValues.append(centimeters!)
        
        print(totalSitReachValues)
        
        let alertController = UIAlertController(title: "\(centimeters!) cm", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        txtSitReach.text = ""
        
    }
    
    func cancelSitReach() {
        
        txtSitReach.text = ""
        
        txtSitReach.resignFirstResponder()
        
    }
    
    func doneTrunkLift() {
        
        txtTrunkLift.resignFirstResponder()
        
        let inches = Int(txtTrunkLift.text!)
        
        
        totalTrunkLiftValues.append(inches!)
        
        print(totalTrunkLiftValues)
        
        let alertController = UIAlertController(title: "\(inches!) in", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        txtTrunkLift.text = ""
        
    }
    
    func cancelTrunkLift() {
        
        txtTrunkLift.text = ""
        
        txtTrunkLift.resignFirstResponder()
    }
    
    func doneArmShoulder() {
        
        txtArmShoulder.resignFirstResponder()
        
        let inches = Int(txtArmShoulder.text!)
        
        
        totalArmShoulderValues.append(inches!)
        
        print(totalArmShoulderValues)
        
        let alertController = UIAlertController(title: "\(inches!) in", message: "Entry Sucessfully Added", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        txtArmShoulder.text = ""

    }
    
    func cancelArmShoulder() {
        
        txtArmShoulder.text = ""
        
        txtArmShoulder.resignFirstResponder()
    }
    
}
