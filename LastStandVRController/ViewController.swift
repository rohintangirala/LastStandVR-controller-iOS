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
    
    var motionManager: CMMotionManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates()
    }

    if motionManager.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

