//
//  WeatherAlertsModel.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 01.04.2023.
//

import Foundation
import UIKit

struct AlertsModel: Decodable {
    let alerts: [WeatherAlertsModel]
}


struct WeatherAlertsModel:Decodable {
    var alertTitle:String
    var sourceOfAlert:String
    var startDate:Date
    var endDate:Date
    var severity:String
    var certainty:String
    var urgency:String
    var description:String
    

    
    enum CodingKeys: String, CodingKey {
        case sourceOfAlert = "senderName"
        case alertTitle = "event"
        case startDate = "dateEffective"
        case endDate = "dateExpires"
        case severity
        case certainty
        case urgency
        case description
    }
}




