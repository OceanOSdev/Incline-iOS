//
// Created by Thomas Maloney on 6/18/16.
// Copyright (c) 2016 Incline. All rights reserved.
//

import Foundation

class WebApiConnector {
    static var authContext: ADAuthenticationContext? = nil

    static func getToken(clearCache: Bool, parent: UIViewController, completionHandler: (result: String?, error: NSError?) -> Void)
    {
        if ApplicationData.userItem.accessToken != nil {
            completionHandler(result: ApplicationData.userItem.accessToken, error: nil)
        }

        // Auth logic
        var er : ADAuthenticationError? = nil
        authContext = ADAuthenticationContext(authority: ApplicationData.authorityURL, error: &er)
        authContext?.parentController = parent

        authContext?.acquireTokenWithResource(ApplicationData.resourceID, clientId: ApplicationData.clientID, redirectUri: ApplicationData.redirectURI) {
            (result: ADAuthenticationResult!) -> Void in
            if (result.accessToken != nil) {
                ApplicationData.userItem.accessToken = result.accessToken
                completionHandler(result: result.accessToken, error: nil)
            }
            else {
                completionHandler(result: nil , error: result.error)
            }
        }
    }

    static func GET(apiUrl: String, parent: UIViewController, success: (task: NSURLSessionDataTask, response:AnyObject?) -> Void)
    {
        let manager = AFHTTPSessionManager()
        manager.responseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = AFJSONRequestSerializer()
        if ApplicationData.userItem.accessToken != nil {
            manager.requestSerializer.setValue("Bearer \(ApplicationData.userItem.accessToken)", forHTTPHeaderField: "Authorization")
        }
        manager.GET(apiUrl, parameters: nil, success: { (task: NSURLSessionDataTask, response:AnyObject?) in
            success(task: task, response: response)
        }) { (operation:NSURLSessionDataTask?, error:NSError) in
            print(error) //TODO: Implement actual error handling
        }
    }

}
