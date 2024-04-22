//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import Foundation

class WeatherViewModel : WeatherViewModelProtocol {

    var weatherNetworkManager: WeatherNetworkingProtocol
    var weatherData : WeatherModel?
    
    init (manager : WeatherNetworkingProtocol) {
        weatherNetworkManager = manager
    }
    
    func getWeatherData(_ lat: String, _ long: String, _ completion: @escaping (Bool) -> Void) {
        self.weatherNetworkManager.getWeatherData(type: WeatherModel.self, lat: lat, long: long) { model in
            self.weatherData = model
            completion(true)
        }
    }

    var todayDate : String{
        return Date().getDate(formate: "EEE, dd MMMM")
    }
    
    var address : String{
        return "📍 " + (weatherData?.name?.toString() ?? "")
    }
    
    var temprature : String {
        return (weatherData?.main?.temp?.toString() ?? "").KelvinToDegree()
    }
    
    var weatherType : String {
        return "Weather Type : " + (weatherData?.weather?.first?.main?.toString() ?? "") + "(\((weatherData?.weather?.first?.description?.toString() ?? "")))"
    }
    
    var visibility : String {
        return "Visibility : " + (weatherData?.visibility?.toString() ?? "").metersToKilometers() + " km"
    }
    
    var humidity : String {
        return "Humidity : " + (weatherData?.main?.humidity?.toString() ?? "") + "%"
    }
    
    var windSpeed : String {
        return "Wind Speed : " + ((weatherData?.wind?.speed?.toString() ?? "").metersPerSecondToKilometersPerHour() ?? "") + " km/h"
    }
    
    var imageURL: String {
        let img = self.weatherData?.weather?.first?.icon?.toString() ?? ""
        return "https://openweathermap.org/img/wn/\(img)@2x.png"
    }
}


