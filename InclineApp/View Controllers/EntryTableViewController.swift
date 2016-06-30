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
        
        
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        WebApiConnector.getToken(false, parent: self) {
            (result: String?, error: NSError?) -> Void in
            if result != nil {
                print(result)
            }
            else {
                
            }
        }
        let manager = AFHTTPSessionManager()
        manager.responseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.requestSerializer.setValue("Bearer \(ApplicationData.graphToken!)", forHTTPHeaderField: "Authorization")
        //manager.dataTaskWithRequest(NSURLRequest().HTTPM, completionHandler: ((NSURLResponse, AnyObject?, NSError?) -> Void)?)
        
        manager.GET("https://graph.windows.net/me?api-version=1.6", parameters: nil, success: { (task: NSURLSessionDataTask, response:AnyObject?) in
            //print(response)
            let responseDict = response as! Dictionary<String, AnyObject>
            let firstName = (responseDict["givenName"] as AnyObject?) as? String
            let lastName = (responseDict["surname"] as AnyObject?) as? String
            let email = (responseDict["mail"] as AnyObject?) as? String
            ApplicationData.Name = "\(firstName!) \(lastName!)"
            ApplicationData.Email = email!
            //print("\(token!) \(responseDict["surname"]!)")
        }) { (operation:NSURLSessionDataTask?, error:NSError) in
            print(error)
        }



    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    //Table data source not needed if not data is being used in the table

}
