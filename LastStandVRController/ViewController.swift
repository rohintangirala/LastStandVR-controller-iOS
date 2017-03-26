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
    var initialX = 0.0
    var initialY = 0.0
    var initialZ = 0.0
  
    @IBAction func calibrate(_ sender: Any) {
        initialX = phoneX
        initialY = phoneY
        initialZ = phoneZ
        print("in \(initialX) \(phoneX)")
    }
    
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
                
                
                print ("\((data?.attitude.yaw)!) \((data?.attitude.roll)!) \((data?.attitude.pitch)!)")
                //phoneAngle = ((data?.attitude.roll)!)
                phoneX = -(data?.attitude.yaw)! - self.initialX
              
              
                phoneY = (data?.attitude.roll)! - self.initialY
          
                phoneZ = (data?.attitude.pitch)! - self.initialZ
              
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

