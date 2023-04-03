//
//  detailAlertsViewModel.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 03.04.2023.
//

import Foundation
import UIKit

class DetailAlertsViewModel {
    var alertsModel:WeatherAlertsModel
    var image:UIImage
    
    init(alertsModel: WeatherAlertsModel, image:UIImage) {
        self.alertsModel = alertsModel
        self.image = image
    }
}
