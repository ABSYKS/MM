//
//  ChatOverview.swift
//  MedicMessenger
//
//  Created by Simon Bessey on 20/06/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import UIKit
import Foundation

var names = [String]()

class ChatOverview: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var hospitalName: UILabel!

    @IBAction func button(sender: AnyObject) {
        names.append(name[sender.tag])

        performSegueWithIdentifier("messages", sender: nil)
    }
    
    @IBOutlet weak var table: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count - 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.table.dequeueReusableCellWithIdentifier("chat", forIndexPath: indexPath) as! TableViewCell
        cell.fullName.text = name[indexPath.row + 1]
        cell.position.text = pos[indexPath.row + 1]
        cell.profilePic.image = image[indexPath.row + 1]
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func viewDidAppear(animated: Bool) {
    hospitalName.text = hosp[0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}