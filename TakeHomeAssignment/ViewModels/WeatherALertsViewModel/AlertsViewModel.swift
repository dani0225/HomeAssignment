//
//  AlertsViewModel.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 03.04.2023.
//

import Foundation
import UIKit
import Combine


class AlertsViewModel {
    
     var alertModel: WeatherAlertsModel
     var image:UIImage

    init(alertModel: WeatherAlertsModel, image:UIImage) {
        self.alertModel = alertModel
        self.image = image
    }
    
}
