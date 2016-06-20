//
// Created by Thomas Maloney on 6/18/16.
// Copyright (c) 2016 Incline. All rights reserved.
//

import Foundation

class WebApiConnector {
    static var authContext: ADAuthenticationContext? = nil

    static func getToken(clearCache: Bool, parent: UIViewController, completionHandler: (result:String?, error:NSError?) -> Void) {
        if ApplicationData.userItem.accessToken != nil {
            completionHandler(result: ApplicationData.userItem.accessToken, error: nil)
        }

        // Auth logic
        var er: ADAuthenticationError? = nil
        authContext = ADAuthenticationContext(authority: ApplicationData.authorityURL, error: &er)
        authContext?.parentController = parent

        authContext?.acquireTokenWithResource(ApplicationData.resourceID, clientId: ApplicationData.clientID, redirectUri: ApplicationData.redirectURI) {
            (result: ADAuthenticationResult!) -> Void in
            if (result.accessToken != nil) {
                ApplicationData.userItem.accessToken = result.accessToken
                completionHandler(result: result.accessToken, error: nil)
            } else {
                completionHandler(result: nil, error: result.error)
            }
        }
    }

    static func logOut() {
        let err: AutoreleasingUnsafeMutablePointer<ADAuthenticationError?> = AutoreleasingUnsafeMutablePointer()
        authContext?.tokenCacheStore.removeAllWithError(err)

        // Enable this if you want to clear all of the cookies currently stored.
        /*var storage : NSHTTPCookieStorage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        for cookie in storage.cookies! {
            storage.deleteCookie(cookie)
        }*/
        authContext = nil
    }


    static func GET(apiUrl: String, parent: UIViewController, success: (task:NSURLSessionDataTask, response:AnyObject?) -> Void) {
        let manager = AFHTTPSessionManager()
        manager.responseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = AFJSONRequestSerializer()
        if ApplicationData.userItem.accessToken != nil {
            manager.requestSerializer.setValue("Bearer \(ApplicationData.userItem.accessToken)", forHTTPHeaderField: "Authorization")
        }
        manager.GET(apiUrl, parameters: nil, success: {
            (task: NSURLSessionDataTask, response: AnyObject?) in
            success(task: task, response: response)
        }) {
            (operation: NSURLSessionDataTask?, error: NSError) in
            print(error) //TODO: Implement actual error handling
        }
    }

    static func Get(apiUrl:String, completion:(json: [[String:AnyObject]]?) -> Void) {
        var request : NSMutableURLRequest = NSMutableURLRequest(URL: NSURL(string:  ApplicationData.baseApiAddress + apiUrl)!)

        let authHeader : String = "Bearer " + ApplicationData.userItem.accessToken
        request.addValue(authHeader, forHTTPHeaderField: "Authorization")
        let queue : NSOperationQueue = NSOperationQueue()
        var ret : [[String:AnyObject]]?
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler: { (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            do {

                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [[String:AnyObject]] {
                    //print("Asynchronous\(jsonResult)")
                    completion(json: jsonResult)
                }

                //let thing = NSString(data:data!, encoding: NSUTF8StringEncoding)as! String
                //print(thing)
                //let another = JSONParser.Parse(thing)
                //print(another)

                print("Success")
            } catch let error as NSError {
                print(error.localizedDescription)
                completion(json: nil)
            } catch {
                completion(json: nil)
            }
        })


    }

}