//
//  ViewController.swift
//  LastStandVRController
//
//  Created by Rohin Tangirala on 3/25/17.
//  Copyright © 2017 Rohin Tangirala. All rights reserved.
//

import UIKit
import CoreMotion

var phoneX : Double = 0.0
var phoneY : Double = 0.0
var phoneZ : Double = 0.0

class ViewController: UIViewController {
  var motionManager: CMMotionManager!
  var initialX : Double = 0.0
  var initialY : Double = 0.0
  var initialZ : Double = 0.0
  
  @IBAction func calibrate(_ sender: Any) {
    initialX = phoneX
    initialY = phoneY
    initialZ = phoneZ
  }
  
  @IBAction func fireButton(_ sender: Any) {
    ControllerManager.sharedInstance.sendFire()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view, typically from a nib.
    motionManager = CMMotionManager()
    motionManager.deviceMotionUpdateInterval = TimeInterval(exactly: 0.25)!

    if motionManager.isDeviceMotionAvailable == true {
      motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler:{
        data, error in

        phoneX = -(data?.attitude.yaw)! - self.initialX
        phoneY = (data?.attitude.roll)! - self.initialY
        phoneZ = (data?.attitude.pitch)! - self.initialZ
        ControllerManager.sharedInstance.sendAngle()
      })
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

