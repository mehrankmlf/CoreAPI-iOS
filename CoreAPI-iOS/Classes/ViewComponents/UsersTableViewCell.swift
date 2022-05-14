//
//  UsersTableViewCell.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFamilyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupParametrs(items : UsersListResponse) {
        self.lblName.text = items.firstName
        self.lblFamilyName.text = items.lastName
    }
}
