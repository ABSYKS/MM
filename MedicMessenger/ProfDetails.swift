//
//  ProfDetails.swift
//  MedicMessenger
//
//  Created by Simon Bessey on 19/06/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import UIKit
import Foundation

var image = [UIImage]()
var rol = [String]()
var pos = [String]()
var poc = [String]()
var teem = [String]()

class ProfDetails: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var role: UITextField!
    @IBOutlet weak var position: UITextField!
    @IBOutlet weak var team: UITextField!
    @IBOutlet weak var pointOfCOntact: UITextField!
    @IBOutlet var background: UIView!
    @IBOutlet weak var plusPic: UIButton!
    let picker = UIImagePickerController()

    @IBAction func newPic(sender: AnyObject) {
        picker.allowsEditing = false //2
        picker.sourceType = .PhotoLibrary //3
        presentViewController(picker, animated: true, completion: nil)//4
    }
    
    @IBOutlet weak var myImageView: UIImageView!
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(
        picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        myImageView.contentMode = .ScaleAspectFit //3
        myImageView.image = chosenImage //4
        image.append(chosenImage)
        dismissViewControllerAnimated(true, completion: nil) //5
        plusPic.enabled = false
        if(image.count > 0){
            plusPic.setTitleColor(UIColor.clearColor(), forState: .Disabled)
        }
    }

    @IBAction func finished(sender: AnyObject) {

        if (role.text!.isEmpty == false && position.text!.isEmpty == false && team.text!.isEmpty == false && pointOfCOntact.text!.isEmpty == false && image.count > 0) {
            
            rol.append(role.text!)
            pos.append(position.text!)
            teem.append(team.text!)
            poc.append(pointOfCOntact.text!)
            // Add fake users into cells
            name.insert("Bob Allen", atIndex: 1)
            name.insert("Ayat Smith", atIndex: 2)
            name.insert("Oliver Batesh", atIndex: 3)
            name.insert("Isabelle Gray", atIndex: 4)
            name.insert("Cardiology", atIndex: 5)
            name.insert("Douglas Wright", atIndex: 6)
            
            pos.insert("SHO", atIndex: 1)
            pos.insert("FY1", atIndex: 2)
            pos.insert("Registrar", atIndex: 3)
            pos.insert("SHO", atIndex: 4)
            pos.insert("12 Members", atIndex: 5)
            pos.insert("Registrar", atIndex: 6)

            image.insert(UIImage(named: "man.jpg")!, atIndex: 1)
            image.insert(UIImage(named: "India-woman.jpg")!, atIndex: 2)
            image.insert(UIImage(named: "man2.jpg")!, atIndex: 3)
            image.insert(UIImage(named: "woman.jpg")!, atIndex: 4)
            image.insert(UIImage(named: "circle.jpg")!, atIndex: 5)
            image.insert(UIImage(named: "man3.jpg")!, atIndex: 6)

            performSegueWithIdentifier("almostThere", sender: nil)
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
        picker.delegate = self
        self.myImageView.layer.cornerRadius = self.myImageView.frame.size.width / 2;
        self.myImageView.clipsToBounds = true;
        self.myImageView.layer.borderWidth = 3.0;
        let color = UIColor.grayColor().CGColor
        let backgound = UIColor.blackColor();
        self.myImageView.layer.borderColor = color;
        self.myImageView.backgroundColor = backgound;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}