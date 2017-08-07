//
//    ControllerManager.swift
//    LastStandVRController
//
//    Created by Rohin Tangirala on 3/25/17.
//    Copyright © 2017 Rohin Tangirala. All rights reserved.
//

import Foundation

class ControllerManager {
    let redisServer : Redis = Redis()
    let ip : String = "10.10.180.94"
    let port : Int = 6379

    var ct : Int = 0

    class var sharedInstance: ControllerManager {
        struct Static {
            static let instance = ControllerManager()
        }
        
        return Static.instance
    }

    init() {
        connect()
        redisServer.Command(Command: "SET appPlatform \"iOS\"")
    }
    
    private func connect() {
        redisServer.server(endPoint: ip, onPort: UInt16(port))
    }
    
    func sendAngle() {
        redisServer.Command(Command: "SET xRot \(phoneX)")
        redisServer.Command(Command: "SET zRot \(phoneZ)")
    }
    
    func sendFire() {
        redisServer.Command(Command: "SET fire 1")
    }
}
