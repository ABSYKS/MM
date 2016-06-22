//
//  messaging.swift
//  MedicMessenger
//
//  Created by Simon Bessey on 21/06/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import Foundation
import UIKit

class messaging: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let picker = UIImagePickerController()
    @IBOutlet weak var message2Send: UITextField!

    @IBOutlet weak var bordertext: UILabel!
    @IBOutlet weak var borderimage: UILabel!
    @IBOutlet weak var imagina: UIImageView!
    @IBAction func send(sender: AnyObject) {
        if(message2Send.text!.isEmpty == false) {
        messageOne.text! = message2Send.text!
            bordertext.backgroundColor = lightGray
        }
        
        else if(message2Send.text == "image") {
            imagina.hidden = false
            borderimage.backgroundColor = lightGray
        }
    }
    
    @IBAction func `import`(sender: AnyObject) {
        picker.allowsEditing = false //2
        picker.sourceType = .PhotoLibrary //3
        presentViewController(picker, animated: true, completion: nil)//4
    }
    
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var messageOne: UILabel!
    
    @IBOutlet weak var images: UIImageView!
    @IBAction func back(sender: AnyObject) {
    performSegueWithIdentifier("backk", sender: nil)
        names.removeAll()
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(
        picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        imagina.contentMode = .ScaleAspectFit //3
        imagina.image = chosenImage //4
        dismissViewControllerAnimated(true, completion: nil) //5
        imagina.hidden = true
        message2Send.text! = "image"
//        plusPic.enabled = false
//        if(image.count > 0){
//            plusPic.setTitleColor(UIColor.clearColor(), forState: .Disabled)
//        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        fullName.text = names[0]

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}