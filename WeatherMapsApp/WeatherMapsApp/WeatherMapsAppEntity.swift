//
//  WeatherMapsAppEntity.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 28/08/24.
//

import Foundation

struct WeatherResponse: Codable {
    var coord: Coord
    var weather: [Weather]
    var name: String
}

struct Coord: Codable {
    var lon: Double
    var lat: Double
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
