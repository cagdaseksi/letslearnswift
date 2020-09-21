//
//  Util.swift
//  AwesomeApp
//
//  Created by MAC on 19.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import SystemConfiguration

class Util {
    static var app: Util = {
        return Util()
    }()
    
    func isInternetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    class NetworkState {
        class func isConnected() ->Bool {
            return NetworkReachabilityManager()!.isReachable
        }
    }
    
}

