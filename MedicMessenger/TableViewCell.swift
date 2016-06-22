//
//  TableViewCell.swift
//  MedicMessenger
//
//  Created by Simon Bessey on 20/06/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var delegate = messaging()

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var position: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width / 2;
        self.profilePic.clipsToBounds = true;
        self.profilePic.layer.borderWidth = 1.0;
        self.profilePic.layer.borderColor = lightGray.CGColor;
        self.profilePic.backgroundColor = darkGray;
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
