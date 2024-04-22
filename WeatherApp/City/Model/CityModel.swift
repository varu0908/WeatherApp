//
//  CityModel.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import Foundation

// MARK: - Welcome
struct CityList: Codable {
    let cities: [City]
}

// MARK: - City
struct City: Codable {
    let city: String
    let latitude, longitude: Double
}
