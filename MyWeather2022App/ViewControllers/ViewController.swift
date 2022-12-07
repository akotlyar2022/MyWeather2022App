//
//  ViewController.swift
//  MyWeather2022App
//
//  Created by macbook on 06.12.22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        networkWeatherManager.onComplition = { currentWeather in
//            print(currentWeather.cityName)
//            print(currentWeather.temperature)
//            print(currentWeather.feelsLikeTemperature)
//        }
        networkWeatherManager.delegate = self
        networkWeatherManager.fetchCurrentWeather(forCity: "Tbilisi")


    }


    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city", message: nil, style: .alert) { city in
            self.networkWeatherManager.fetchCurrentWeather(forCity: city) 
        }
    }
    
    
}

extension ViewController: NetworkWeatherManagerDelegate {
    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) {
        print(currentWeather.cityName)
    }
}
