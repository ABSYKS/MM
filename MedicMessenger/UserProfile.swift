//
//  UserProfile.swift
//  MedicMsngr
//
//  Created by Simon Bessey on 22/06/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import Foundation
import UIKit
var nam = [String]()
class UserProfile: UIViewController {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameFull: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var positions: UILabel!
    @IBOutlet weak var teams: UILabel!
    @IBOutlet weak var pointOfC: UILabel!
    @IBOutlet weak var about: UILabel!
    @IBOutlet weak var contactDetails: UIButton!
//
//    func contacts(let ip: Bool) {
//        if(ip == true) {
//            contactDetails.hidden = true
//        }
//        
//        else {
//            contactDetails.hidden = false
//        }
//    }
    func myInfo(){
    nameFull.text = nam[0]
    }
        @IBAction func close(sender: AnyObject) {
        performSegueWithIdentifier("directory", sender: nil)
        nam.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true

        myInfo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}