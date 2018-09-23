//
//  ThirdViewController.swift
//  GPi
//
//  Created by Mukul on 7/27/18.
//  Copyright © 2018 Mukul. All rights reserved.
//

import UIKit
import CocoaMQTT

//no default ip
var IP_Variable_Settings = ""
//defualt port is 1883 but it can be changed...
var PORT_Variable_Settings: UInt16 = 1883
//defualt is 8080 but can be changed
var PORT_Variable_Camera: UInt16 = 8080


var mqttClient = CocoaMQTT(clientID: "iOS Device", host: IP_Variable_Settings, port: PORT_Variable_Settings)

let defaults = UserDefaults.standard


var User_Saved_IP = ""
var User_Saved_PORT: UInt16? = UInt16("")
var User_Saved_PORT_CAM: UInt16? = UInt16("")


class ThirdViewController: UIViewController {
    
    @IBOutlet var txtIP: UITextField!

    @IBOutlet var txtPORT: UITextField!
    
    @IBOutlet var txtPORTCAM: UITextField!
    
    
    func student(name: String) -> String {
        return name
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //get user saved data
        let testingIP = defaults.string(forKey: "IP")
        let testingPORT = defaults.string(forKey: "PORT")
        let testingPORT_CAM = defaults.string(forKey: "PORT_CAM")


        if (testingIP != nil) && (testingPORT != nil) && (testingPORT_CAM != nil){
            
            print("User Saved IP: " + testingIP!)
            print("User Saved PORT: " + testingPORT!)
            print("User Saved PORT Camera: " + testingPORT_CAM!)


            
            txtIP.text = testingIP
            txtPORT.text = testingPORT
            txtPORTCAM.text = testingPORT_CAM
            


        }
        
    

        
        
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    //connect to Pi
    @IBAction func btn_Connect(_ sender: Any) {
        self.view.endEditing(true);
        
        //get new value
        var temp_ip: String = txtIP.text!
        var temp_port: UInt16? = UInt16(txtPORT.text!)
        print(temp_ip)
        print(temp_port)
        
        var temp_port_cam: UInt16? = UInt16(txtPORTCAM.text!)
        print(temp_port_cam)


        IP_Variable_Settings = temp_ip
        
        User_Saved_IP = temp_ip
        
        User_Saved_PORT = temp_port
        
        User_Saved_PORT_CAM = temp_port_cam

        
        //save Defaults on button push
        
        defaults.set(User_Saved_IP, forKey: "IP")
        
        defaults.set(User_Saved_PORT, forKey: "PORT")
        
        defaults.set(User_Saved_PORT_CAM, forKey: "PORT_CAM")



        

        mqttClient = CocoaMQTT(clientID: "iOS Device", host: IP_Variable_Settings, port: PORT_Variable_Settings)

        
        let x : UInt16 = temp_port_cam!
        var myString = String(x)

        var string_cam_url = "http://" + temp_ip + ":" + myString + "/camera/livestream.m3u8"

        let url : URL = URL(string: string_cam_url)!


        
        //connect
        mqttClient.connect()
        
        
        print("CONNECT NOW VAR STATE: " + IP_Variable_Settings)

    }

    
    @IBAction func btn_Reset(_ sender: Any) {
        
        //reset value
        print("RESET NOW VAR STATE: " + IP_Variable_Settings)
        IP_Variable_Settings = ""
        txtIP.text = nil
        txtPORT.text = "1883"
        txtPORTCAM.text = "8080"


        //disconnect
        mqttClient.disconnect()
        print("Disconnect")
        
        defaults.set("", forKey: "IP")



    }
    

    
}

