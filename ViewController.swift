//
//  ViewController.swift
//  TouchIDTest
//
//  Created by Armin Bajrica on 01.03.18.
//  Copyright © 2018 Armin Bajrica. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet weak var StoryLable: UILabel!
    
    var text_siri: String = "Siri told me...she lives in a virtual galaxy as an agent"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ActionID(_ sender: Any)
    {
        let context:LAContext = LAContext()
        var error : NSError?
        
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error)
        {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Siri is just be ready to tell you something.." , reply: {
                (Success : Bool, NSError) in
                if Success
                {
                    self.StoryLable.text = self.text_siri
                    
                }
            })
            
        }
        else
        {
            
            
        }
        
        
    }
    
}

