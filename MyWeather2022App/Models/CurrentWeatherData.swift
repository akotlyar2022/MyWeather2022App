//
//  CurrentWeatherData.swift
//  MyWeather2022App
//
//  Created by macbook on 07.12.22.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
//        case weatherDescription = "description"
    }
}

struct Weather: Codable {
    let id: Int
//    let weatherDescription: String
}
