//
//  UserTableViewCell.swift
//  TechOClock
//
//  Created by ThiagoGarcia on 30/06/2021.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNif: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    var userListCellViewModel : UserListCellViewModel? {
        didSet{
            self.lblEmail.text = userListCellViewModel?.lblEmail
            self.lblEmail.accessibilityIdentifier = "emailCell"
            self.lblName.text  = userListCellViewModel?.lblName
            self.lblName.accessibilityIdentifier = "nameCell"
            self.lblNif.text   = userListCellViewModel?.lblNif
            self.lblNif.accessibilityIdentifier = "nifCell"
        }
    }
    
}
