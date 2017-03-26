//
//  ViewController.swift
//  LastStandVRController
//
//  Created by Rohin Tangirala on 3/25/17.
//  Copyright © 2017 Rohin Tangirala. All rights reserved.
//

import UIKit
import CoreMotion

var phoneX = 0.0;
var phoneY = 0.0;
var phoneZ = 0.0;

class ViewController: UIViewController {
    
    
    var motionManager: CMMotionManager!
    var previousX = 0;
    
    
    @IBAction func fireButton(_ sender: Any) {
        print("FIRE")
        ControllerManager.sharedInstance.sendFire()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        motionManager = CMMotionManager()
        //motionManager.startDeviceMotionUpdates()
        motionManager.deviceMotionUpdateInterval = TimeInterval(exactly: 0.25)!
        if motionManager.isDeviceMotionAvailable == true {
            motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler:{
                data, error in
                
                print ("\((data?.attitude.pitch)!) \((data?.attitude.roll)!) \((data?.attitude.yaw)!)")
                //phoneAngle = ((data?.attitude.roll)!)
                phoneX = (data?.attitude.pitch)!
                phoneY = (data?.attitude.roll)!
                phoneZ = (data?.attitude.yaw)!
                //self.printPhoneAngle()
                ControllerManager.sharedInstance.sendAngle()
            })
        }
        
    }
   

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }


}

