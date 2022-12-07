//
//  CurrentWeather.swift
//  MyWeather2022App
//
//  Created by macbook on 07.12.22.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return "\(temperature.rounded())"
    }
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return "\(feelsLikeTemperature.rounded())"
    }
    
    let conditionCode: Int
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
