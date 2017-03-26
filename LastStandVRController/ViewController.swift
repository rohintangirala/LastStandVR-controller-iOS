//
//  ViewController.swift
//  LastStandVRController
//
//  Created by Rohin Tangirala on 3/25/17.
//  Copyright © 2017 Rohin Tangirala. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let redisServer = Redis()
    let ip = "10.10.180.94"
    let port = 6379
    var motionManager: CMMotionManager!
    var previousX = 0;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        motionManager = CMMotionManager()
        //motionManager.startDeviceMotionUpdates()
        if motionManager.isDeviceMotionAvailable == true {
            motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler:{
                data, error in
                
                print ((data?.attitude.roll)!)
            })
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }


}

