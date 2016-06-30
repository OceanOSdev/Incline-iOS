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

    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
    // Author: Thomas Maloney
    // Desc: Handles the logout logic for the application
    @IBAction func btnLogOut(sender: AnyObject) {
        //TODO: Handle invalid state that will inevitably be passed around the application during runtime
        
        WebApiConnector.logOut()

        let alertController = UIAlertController(title: "Log Out Successful", message: "Warning: Application may be unstable until next sign in.", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))

        self.presentViewController(alertController, animated: true, completion: nil)
        emailField.text = "Not Signed In"
        NameField.text = "Not Signed In"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        WebApiConnector.authContext?.acquireTokenWithResource("https://graph.windows.net", clientId: ApplicationData.clientID, redirectUri: ApplicationData.redirectURI) {
            (result: ADAuthenticationResult!) -> Void in
            dispatch_async(dispatch_get_global_queue(self.priority, 0)) {
            
            if (result.accessToken != nil) {
                //ApplicationData.graphToken = result.accessToken
                print(result)
                let manager = AFHTTPSessionManager()
                manager.responseSerializer = AFJSONResponseSerializer()
                manager.requestSerializer = AFJSONRequestSerializer()
                manager.requestSerializer.setValue("Bearer \(result.accessToken)", forHTTPHeaderField: "Authorization")
                //manager.dataTaskWithRequest(NSURLRequest().HTTPM, completionHandler: ((NSURLResponse, AnyObject?, NSError?) -> Void)?)
                
                manager.GET("https://graph.windows.net/me?api-version=1.6", parameters: nil, success: { (task: NSURLSessionDataTask, response:AnyObject?) in
                    //print(response)
                    let responseDict = response as! Dictionary<String, AnyObject>
                    let firstName = (responseDict["givenName"] as AnyObject?) as? String
                    let lastName = (responseDict["surname"] as AnyObject?) as? String
                    let email = (responseDict["mail"] as AnyObject?) as? String
                    dispatch_async(dispatch_get_main_queue()) {

                        self.NameField.text = "\(firstName!) \(lastName!)"
                        self.emailField.text = email!
                    }
                    print("\(firstName!) \(responseDict["surname"]!)")
                }) { (operation:NSURLSessionDataTask?, error:NSError) in
                    print(error)
                }
                
            }
            else {
                print(result.status)
            }
        }
        }
        
        //NameField.text = ApplicationData.Name
        //emailField.text = ApplicationData.Email
        
        //emailField.text = "hi"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
