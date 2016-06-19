//
// Created by Thomas Maloney on 6/18/16.
// Copyright (c) 2016 Incline. All rights reserved.
//

import Foundation

struct ApplicationData {
    static let resourceID : String = "https://thomastnflive.onmicrosoft.com/Incline"
    static let authorityURL : String = "https://login.microsoftonline.com/common"
    static let clientID : String = "77607242-dc15-43a2-a782-1cbda2dc6fe8"
    static let redirectURI : NSURL = NSURL(string: "Incl://incline.InclineApp")!

    static let baseWebAddress : String = "https://incline.azurewebsites.net"
    static let baseApiAddress : String = "https://incline.azurewebsites.net/api/"

    static var userItem : ADTokenCacheStoreItem = ADTokenCacheStoreItem()
}
