//
//  FirstViewController.swift
//  GPi
//
//  Created by Mukul on 7/26/18.
//  Copyright © 2018 Mukul. All rights reserved.
//

import UIKit
import CocoaMQTT


 class FirstViewController: UIViewController {
    
    let GPIO_PIN_NUM = ["23", "24", "27", "22"]
    
    var GPIO_pin_selected = "23"
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
   @objc @IBAction func indexChanged(_ sender: UISegmentedControl) {
    switch(sender.selectedSegmentIndex){
        case 0:
            GPIO_pin_selected = GPIO_PIN_NUM[0]
            print(GPIO_pin_selected)
        case 1:
            GPIO_pin_selected = GPIO_PIN_NUM[1]
            print(GPIO_pin_selected)
        case 2:
            GPIO_pin_selected = GPIO_PIN_NUM[2]
            print(GPIO_pin_selected)
        case 3:
            GPIO_pin_selected = GPIO_PIN_NUM[3]
            print(GPIO_pin_selected)
        default:
            break
        }
    }
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //chnage: this one button will open and close door
    //with a .2 sec delay in my python script to reset
    //the 5v relay.
    @IBAction func btn_close(_ sender: UIButton) {

        
        print("OFF button" )
        mqttClient.publish("rpi/gpio", withString: "off " + GPIO_pin_selected)
        
    }
    
    
    
}

