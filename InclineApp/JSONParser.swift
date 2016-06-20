//
// Created by Thomas Maloney on 6/19/16.
// Copyright (c) 2016 Incline. All rights reserved.
//

import Foundation

class JSONParser {

    static func Parse(json: String) -> [String : AnyObject]? {
        if let data = json.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error.localizedDescription)
            } catch {
                print("Something's wrong.")
            }
        }

        return nil
    }
}