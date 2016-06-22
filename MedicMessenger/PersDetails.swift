//
//  PersDetails.swift
//  MedicMessenger
//
//  Created by Simon Bessey on 19/06/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import UIKit
import Foundation

var hosp = [String]()
var post = [String]()
var couny = [String]()
var contry = [String]()
var number = [String]()

class PersDetails: UIViewController {

    @IBOutlet weak var hospital: UITextField!
    @IBOutlet weak var postCode: UITextField!
    @IBOutlet weak var county: UITextField!
    @IBOutlet weak var phoneNUmber: UITextField!
    @IBOutlet var background: UIView!

    @IBAction func next(sender: AnyObject) {
        if (hospital.text?.isEmpty == false && postCode.text?.isEmpty == false && county.text?.isEmpty == false && phoneNUmber.text?.isEmpty == false) {
            hosp.append(hospital.text!)
            post.append(postCode.text!)
            couny.append(county.text!)
            number.append(phoneNUmber.text!)
            performSegueWithIdentifier("professional", sender: nil)
        }
        
        else {
            alert()
        }
    }
    
    func alert() {
        if #available(iOS 8.0, *) {
            let alert = UIAlertController(title: "Invalid", message: "You have incorrectly filled in the fields.", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(defaultAction)
            presentViewController(alert, animated: true, completion: nil)
            
        } else {
            // Fallback on earlier versions
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.backgroundColor = lightGray
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}