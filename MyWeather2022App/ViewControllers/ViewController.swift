//
//  ViewController.swift
//  MyWeather2022App
//
//  Created by macbook on 06.12.22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    lazy var locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization()
        return lm
    }()
    
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
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }

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
//MARK: - CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        networkWeatherManager.fetchCurrentWeather(forCity: <#T##String#>)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
