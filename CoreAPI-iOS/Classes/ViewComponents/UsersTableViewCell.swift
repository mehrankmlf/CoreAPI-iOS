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
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupParametrs(items : UsersListResponse) {
        self.lblName.text = "items"
    }
}
