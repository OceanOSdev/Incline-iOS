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
    
    static func getTimes(json: [AnyObject]?) -> [String] {
        let interArray = json!.map({[$0.componentsSeparatedByString("-")[0],$0.componentsSeparatedByString("-")[1],NSString(string: $0.componentsSeparatedByString("-")[2]).substringToIndex(2)]})
        let ret = interArray.map({"\($0[1])/\($0[2])/\($0[0])"})
        return ret
    }

    // Takes a dictionary and returns an array of the values from the specified key
    static func DictionaryToArray(key: String, dict: [[String:AnyObject]]?) -> [AnyObject]? {
        var ret : [AnyObject]? = []
        for array in dict! {
            ret?.append(array[key]!)
        }
        return ret
    }
}
