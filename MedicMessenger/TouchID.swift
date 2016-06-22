//
//  TouchID.swift
//  MedicMessenger
//
//  Created by Simon Bessey on 22/06/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import Foundation
import LocalAuthentication
import UIKit

class TouchID: UIViewController {
    
    @IBAction func skip(sender: AnyObject) {
        performSegueWithIdentifier("finish", sender: nil)
    }
    
    func runSecretCode() {
        performSegueWithIdentifier("finish", sender: nil)
    }
    
    func authenticateUser() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] (success: Bool, authenticationError: NSError?) -> Void in
                
                dispatch_async(dispatch_get_main_queue()) {
                    if success {
                        self.runSecretCode()
                    } else {
                        if let error = authenticationError {
                            if error.code == LAError.UserFallback.rawValue {
                                let ac = UIAlertController(title: "Authentication failed", message: "You must enter a passcode.", preferredStyle: .Alert)
                                ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                                self.presentViewController(ac, animated: true, completion: nil)
                                self.runSecretCode()

                            }
                        }
                        
                        let ac = UIAlertController(title: "Authentication failed", message: "Your fingerprint could not be verified; please try again.", preferredStyle: .Alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                        self.presentViewController(ac, animated: true, completion: nil)
                        self.runSecretCode()
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(ac, animated: true, completion: nil)
            self.runSecretCode()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        authenticateUser()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}