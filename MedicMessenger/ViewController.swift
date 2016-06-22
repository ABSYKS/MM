//
//  ViewController.swift
//  MedicMessenger
//
//  Created by Simon Bessey on 18/06/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import UIKit

var name = [String]()
var last = [String]()
var emails = [String]()
var users = [String]()
let lightGray = UIColor.init(red: 87/255, green: 87/255, blue: 87/255, alpha: 1)
let darkGray = UIColor.init(red: 46/255, green: 46/255, blue: 46/255, alpha: 1)

class ViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var next: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var signup: UIButton!
    
    @IBAction func pageComplete(sender: AnyObject) {
        if(firstName.text?.isEmpty == false && lastName.text?.isEmpty == false && email.text?.isEmpty == false) {
        
            let emailToString = Array(email.text!.characters)
            if(emailToString.contains("@") && emailToString.contains(".")) {
        if((email.text?.containsString("nhs.uk")) == true){
        performSegueWithIdentifier("signUpOne", sender: nil)
            name.append(firstName.text!)
            last.append(lastName.text!)
                }
                else {
                    alert()
                }
            }
            
            else{
                alert()
            }
        }
        else {
        alert()
        }
    }
    
    func alert() {
        let alert = UIAlertController(title: "Invalid", message: "You have incorrectly filled in the fields.", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        presentViewController(alert, animated: true, completion: nil)

    }
    @IBAction func signUp(sender: AnyObject) {
        email.hidden = false
        firstName.placeholder = "Full Name:"
        lastName.placeholder = "Password:"
        signup.backgroundColor = darkGray
        login.backgroundColor = lightGray
        next.text = "Next"
    }
    
    @IBAction func logIn(sender: AnyObject) {
        email.hidden = true
        firstName.placeholder = "Email:"
        lastName.placeholder = "Password:"
        signup.backgroundColor = lightGray
        login.backgroundColor = darkGray
        next.text = "Login"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.backgroundColor = lightGray
        overground.backgroundColor = darkGray
        signup.backgroundColor = darkGray
        login.backgroundColor = lightGray
        // Do any additional setup after loading the view, typically from a nib.
        users.insert("Bob Allen", atIndex: 0)
        users.insert("Ayat Smith", atIndex: 1)
        users.insert("Oliver Batesh", atIndex: 2)
        users.insert("Isabelle Gray", atIndex: 3)
        users.insert("Cardiology", atIndex: 4)
        users.insert("Douglas Wright", atIndex: 5)
        users.insert("Isabelle Gray", atIndex: 6)
        users.insert("Greg White", atIndex: 7)
    }
    
    @IBOutlet var background: UIView!
    @IBOutlet weak var overground: UILabel!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //keyboard functions
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
   }
