//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import Foundation

// MARK: - Welcome
struct WeatherModel : Codable {
    let weather: [Weather]?
    let main: Main?
    let visibility: Temp?
    let wind: Wind?
    let name: Temp?
}


// MARK: - Main
struct Main: Codable {
    let temp: Temp?
    let feelsLike: Temp?
    let tempMin, tempMax: Temp?
    let pressure, humidity: Temp?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Weather
struct Weather: Codable {
    let main, description, icon: Temp?
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Temp?
}

enum Temp: Codable {
    case double(Double)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Temp.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Temp"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
    
    func toString() -> String {
           switch self {
           case .double(let value):
               return String(value)
           case .string(let value):
               return value
           }
       }
}
