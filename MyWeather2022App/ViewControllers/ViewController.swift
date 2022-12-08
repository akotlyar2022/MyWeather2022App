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

        
        
        networkWeatherManager.onComplition = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
//            print(currentWeather.cityName)
//            print(currentWeather.temperature)
//            print(currentWeather.feelsLikeTemperature)

        }
//        networkWeatherManager.delegate = self
        networkWeatherManager.fetchCurrentWeather(forCity: "Tbilisi")
    }
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString + " ˚C"
            self.feelsLikeTemperatureLabel.text = "Feels like: " + weather.feelsLikeTemperatureString + " ˚C"
            self.weatherIconImageView.image = UIImage(systemName: weather.sytemIconNameString)
//            self.descriptionLabel.text = weather.descriptionString
        }
    }


    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city", message: nil, style: .alert) {[unowned self] city in
            self.networkWeatherManager.fetchCurrentWeather(forCity: city) 
        }
    }
}

//extension ViewController: NetworkWeatherManagerDelegate {
//    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) {
//        print(currentWeather.cityName)
//    }
//}
