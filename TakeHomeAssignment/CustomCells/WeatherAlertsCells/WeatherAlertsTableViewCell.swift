//
//  WeatherAlertsTableViewCell.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 01.04.2023.
//

import UIKit

class WeatherAlertsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var alertStartDateLabel: UILabel!
    @IBOutlet weak var alertEndDateLabel: UILabel!
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var imageThumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configureCell(with model:AlertsViewModel) {
        titleLabel.text = model.alertModel.alertTitle
        let startDateString = model.tranformDateToString(date: model.alertModel.startDate)
        alertStartDateLabel.text = "Start Date: \(startDateString)"
        let endDateString = model.tranformDateToString(date: model.alertModel.endDate)
        alertEndDateLabel.text = "End Date: \(endDateString)"
        sourceLabel.text = "Source: \(model.alertModel.sourceOfAlert)"
        imageThumbnail.image = model.image
    }
}
