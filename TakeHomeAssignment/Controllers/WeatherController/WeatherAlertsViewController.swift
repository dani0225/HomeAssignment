//
//  WeatherAlertsViewController.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 29.03.2023.
//

import UIKit
import Combine

class WeatherAlertsViewController: UIViewController {
    
    private var alertsModel:AlertsModel?
    private var randomImages:[UIImage] = []
    private let requestWeather = RequestWeather()
    private var cancellables = Set<AnyCancellable>()
    private var testIMage = UIImage()

    override func viewDidLoad()  {
        super.viewDidLoad()
        configureTableView()
        makeApiCall()
    }
    
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UINib(nibName: Const.weatherAlertsNibName, bundle: .main), forCellReuseIdentifier: Const.weatherAlertsCell)
        return table
    }()
    
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
    }
    private func makeApiCall()  {
        
        requestWeather.weatherAlertsServiceType.getWeatherAlerts()
            .receive(on: DispatchQueue.main)
            .sink { completion in
            if case .failure(let error) = completion {
                print(error)
            }
        } receiveValue: { [weak self] alerts in
            self?.alertsModel = alerts
            self?.getRandomImages(alertModel: alerts)
        }.store(in: &cancellables)

    }

    private func getRandomImages(alertModel:AlertsModel) {
        requestWeather.weatherAlertsServiceType.getRandomImages(model: alertModel) { [weak self] images in
            self?.randomImages = images
            self?.tableView.reloadData()
        }
    }
}

extension WeatherAlertsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alertsModel?.alerts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Const.weatherAlertsCell, for: indexPath) as? WeatherAlertsTableViewCell, let weatherModel = alertsModel?.alerts[indexPath.row] else {
            return UITableViewCell()
        }
       let randomImage = randomImages[indexPath.row]
       let viewModel = AlertsViewModel(alertModel: weatherModel, image: randomImage)
        cell.configureCell(with: viewModel)
        
        return cell
    }
    
    
}




extension WeatherAlertsViewController: UITableViewDelegate {
    
}
