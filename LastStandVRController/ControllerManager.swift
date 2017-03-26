//
//  ControllerManager.swift
//  LastStandVRController
//
//  Created by Rohin Tangirala on 3/25/17.
//  Copyright © 2017 Rohin Tangirala. All rights reserved.
//

import Foundation

class ControllerManager {
    let redisServer = Redis()
    let ip = "10.10.180.94"
    let port = 6379
    var ct = 0
    init() {
        connect()
        redisServer.Command(Command: "SET appPlatform \"iOS\"")
        
        
    }
    
    private func connect() {
        redisServer.server(endPoint: ip, onPort: UInt16(port))
    }
    
    class var sharedInstance: ControllerManager {
        struct Static {
            static let instance = ControllerManager()
        }
        return Static.instance
    }
    
    func sendAngle() {
       
        redisServer.Command(Command: "SET xRot 0 \(phoneX)")
        
        redisServer.Command(Command: "SET zRot 0 \(phoneZ)")
        
        
    }
    
    func sendFire() {
        redisServer.Command(Command: "SET fire 0 1")
    }
    
}
