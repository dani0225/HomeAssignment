//
//  DetailContactTableViewCell.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 31.03.2023.
//

import UIKit

protocol DeleteButtonTapped:AnyObject {
    func deleteButtonTaped()
}

class DetailContactTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    weak var delegate: DeleteButtonTapped?
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        delegate?.deleteButtonTaped()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    func configueCell(with model: DetailContactsViewModel) {
        nameLabel.text = model.name
    }

}
