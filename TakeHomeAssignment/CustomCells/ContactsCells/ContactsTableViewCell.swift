//
//  ContactsTableViewCell.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 30.03.2023.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var duplicatesLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func configureCell(with model:ContactsTableViewCellViewModel) {
        titleLabel.text = model.title
        duplicatesLabel.text = model.duplicates
        phoneNumberLabel.text = model.phoneNumber
    }

}
