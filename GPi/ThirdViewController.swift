//
//  ThirdViewController.swift
//  GPi
//
//  Created by Mukul on 7/27/18.
//  Copyright © 2018 Mukul. All rights reserved.
//

import UIKit
import CocoaMQTT

var IP_Variable_Settings = ""
//defualt port is 1883 but it can be changed...
var PORT_Variable_Settings: UInt16 = 1883


var mqttClient = CocoaMQTT(clientID: "iOS Device", host: IP_Variable_Settings, port: PORT_Variable_Settings)

let defaults = UserDefaults.standard


var User_Saved_IP = ""
var User_Saved_PORT: UInt16? = UInt16("")


class ThirdViewController: UIViewController {
    
    @IBOutlet var txtIP: UITextField!

    @IBOutlet var txtPORT: UITextField!
    
    func student(name: String) -> String {
        return name
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //get user saved data
        let testingIP = defaults.string(forKey: "IP")
        let testingPORT = defaults.string(forKey: "PORT")

        if (testingIP != nil) && (testingPORT != nil){
            
            print("User Saved IP: " + testingIP!)
            print("User Saved PORT: " + testingPORT!)

            
            txtIP.text = testingIP
            txtPORT.text = testingPORT
            
             mqttClient = CocoaMQTT(clientID: "iOS Device", host: testingIP!, port: PORT_Variable_Settings)
            
            mqttClient.connect()
            

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

        IP_Variable_Settings = temp_ip
        
        User_Saved_IP = temp_ip
        
        User_Saved_PORT = temp_port

        
        //save Defaults on button push
        
        defaults.set(User_Saved_IP, forKey: "IP")
        
        defaults.set(User_Saved_PORT, forKey: "PORT")


        

        mqttClient = CocoaMQTT(clientID: "iOS Device", host: IP_Variable_Settings, port: PORT_Variable_Settings)


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

        //disconnect
        mqttClient.disconnect()
        print("Disconnect")
        
        defaults.set("", forKey: "IP")



    }
    

    
}

