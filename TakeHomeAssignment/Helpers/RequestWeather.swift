//
//  WeatherAlertsViewModel.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 02.04.2023.
//

import Foundation
import Combine
import UIKit

class RequestWeather {
    
    let weatherAlertsServiceType: WeatherServiceType
   
    
    init(weatherAlertsServiceType: WeatherServiceType = WeatherService()) {
        
        self.weatherAlertsServiceType = weatherAlertsServiceType
    }
    
}
