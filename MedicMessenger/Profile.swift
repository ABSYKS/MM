//
//  Profile.swift
//  MedicMessenger
//
//  Created by Simon Bessey on 20/06/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import Foundation
import UIKit

class Profile: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let picker = UIImagePickerController()
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var hospitalName: UILabel!
    @IBOutlet weak var postCodeName: UILabel!
    @IBOutlet weak var phoneNumberText: UILabel!
    @IBOutlet weak var roleName: UILabel!
    @IBOutlet weak var positionName: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var aboutMe: UILabel!
    @IBOutlet weak var pointOfC: UILabel!

    func loadDetails() {
        fullName.text = name[0]
        hospitalName.text = hosp[0]
        postCodeName.text = post[0]
        phoneNumberText.text = number[0]
        positionName.text = pos[0]
        roleName.text = rol[0]
        teamName.text = teem[0]
        pointOfC.text = poc[0]
        aboutMe.text = "Tell everyone something about yourself!"
    }
    
override func viewDidLoad() {
    super.viewDidLoad()
    loadDetails()
    picker.delegate = self
    if (image.count > 0) {
        myImage.image = image[0]
        myImage.contentMode = .ScaleAspectFit
        self.myImage.layer.cornerRadius = self.myImage.frame.size.width / 2;
        self.myImage.clipsToBounds = true;
        self.myImage.layer.borderWidth = 3.0;
        let color = UIColor.grayColor().CGColor
        let backgound = UIColor.blackColor();
        self.myImage.layer.borderColor = color;
        self.myImage.backgroundColor = backgound;        }
    // Do any additional setup after loading the view, typically from a nib.
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}