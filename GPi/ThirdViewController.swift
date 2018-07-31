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

var User_Saved_IP = ""

class ThirdViewController: UIViewController {
    
    @IBOutlet var txtIP: UITextField!

    @IBOutlet var txtPORT: UITextField!
    // var MyStr: String = ""
 //   var mqttClient: CocoaMQTT = CocoaMQTT(clientID: "iOS Device", host: "10.0.0.50", port: 1883)
    
      //  lazy var mqttClient = CocoaMQTT(clientID: "iOS Device", host: MyStr, port: 1883)
        
    
 
    func student(name: String) -> String {
        return name
    }
    
   // lazy var MyStr = txtIP.text!
   // lazy var mqttClient = CocoaMQTT(clientID: "iOS Device", host: MyStr, port: 1883)
   // lazy var mqttClient = CocoaMQTT(clientID: "iOS Device", host: MyStr, port: 1883)
   // lazy var mqttClient = CocoaMQTT(clientID: "iOS Device", host: MyStr, port: 1883)
   // var mqttClient = CocoaMQTT(clientID: "iOS Device", host: MyStr, port: 1883)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UserDefaults.standard.set("String", forKey: "Key")
        
        let string = UserDefaults.standard.object(forKey: "Key")
        print(string!)
        
        let userDefaults = UserDefaults.standard

        
        userDefaults.set(User_Saved_IP, forKey: "IP")
        
        
        let testobj = userDefaults.object(forKey: "IP")
        
        print("Saved IP Third: ")
        print(testobj ?? "")
        

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


    }
    

    
}

