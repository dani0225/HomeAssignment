//
//  WeatherService.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 02.04.2023.
//

import Foundation
import Combine
import UIKit

enum CustomError: Error {
    case invalidUrl
}



protocol WeatherServiceType {
    func getWeatherAlerts() -> AnyPublisher<AlertsModel, Error>
    func getImageFromApi() -> AnyPublisher<UIImage, Error>
    func getRandomImages(model:AlertsModel, completion: @escaping ([UIImage]) -> Void)
}


class WeatherService: WeatherServiceType {
    
    var cancellables = Set<AnyCancellable>()
    
    func getWeatherAlerts() -> AnyPublisher<AlertsModel, Error> {
        guard let url = URL(string: "https://api.alltheapps.org/weather/v3/allActiveAlerts?apiKey=da230328") else {
            return Fail(error: CustomError.invalidUrl).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .catch { error in
                return Fail(error: error).eraseToAnyPublisher()
            }.map( {$0.data})
            .decode(type: AlertsModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
    func getImageFromApi() -> AnyPublisher<UIImage, Error> {
        guard let url = URL(string: "https://picsum.photos/200") else {
            return Fail(error: CustomError.invalidUrl).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .catch { error in
                return Fail(error: error).eraseToAnyPublisher()
            }.map { UIImage(data: $0.data)! }
            .eraseToAnyPublisher()
    }
    
    func getRandomImages(model:AlertsModel, completion: @escaping ([UIImage]) -> Void)  {
        var images:[UIImage] = []
        let dispatchGroup = DispatchGroup()
        for _ in model.alerts {
            dispatchGroup.enter()
              getImageFromApi()
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    if case .failure(let error) = completion {
                        dispatchGroup.leave()
                        print(error)
                    }
                } receiveValue: { image in
                    images.append(image)
                    dispatchGroup.leave()
                }.store(in: &cancellables)
        }
        dispatchGroup.notify(queue: .main) {
            completion(images)
        }
        
    }
}

