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
        redisServer.Command(Command: "LPUSH list 0")
    
        
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
        /*ct = ct + 1
        //print("sendAngle()")
        let angle = phoneAngle
        //print(angle)
        var angleToPass = Double(round(1000*(angle-Double.pi/2))/1000)
        if (angle > Double.pi/2+0.5) {
            //angleToPass =
            //redisServer.Command(Command: "LSET list 0 \(angleToPass)")
        } else if (angle < Double.pi/2-0.5) {
            //angleToPass = Double(round(1000*(angle-Double.pi/2))/1000)
            //redisServer.Command(Command: "LSET list 0 \(angleToPass)")
        }*/
        
    }
    
}
