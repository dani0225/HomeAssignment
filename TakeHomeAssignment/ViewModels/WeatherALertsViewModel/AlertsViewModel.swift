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
     let weatherAlertsServiceType: WeatherServiceType
     var cancellables = Set<AnyCancellable>()
   

    init(alertModel: WeatherAlertsModel, image:UIImage, weatherAlertsServiceType: WeatherServiceType = WeatherService()) {
        self.alertModel = alertModel
        self.image = image
        self.weatherAlertsServiceType = weatherAlertsServiceType
    }
    
    
    func tranformDateToString(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    
}
