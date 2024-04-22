//
//  WeatherViewModelProtocol.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import Foundation

protocol WeatherViewModelProtocol {
    var weatherNetworkManager : WeatherNetworkingProtocol { get set }
    var weatherData : WeatherModel? { get set }
    var todayDate : String { get }
    var address : String { get }
    var temprature : String { get }
    var weatherType : String { get }
    var visibility : String { get }
    var humidity : String { get }
    var windSpeed : String { get }
    var imageURL : String { get }
    func getWeatherData(_ lat : String, _ long : String, _ completion : @escaping (Bool) -> Void)
   
}
