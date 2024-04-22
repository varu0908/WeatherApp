//
//  RequestFactory.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import Foundation

class RequestFactory {
    
    static let shared = RequestFactory.init()
    
    private init() {
        
    }
    
    func getRequestCityList() -> URL?{
        guard let url = Bundle.main.url(forResource: "1", withExtension: "json") else{
            print("Invalid URL....")
            return nil
        }
        return url
    }
    
    func getWeather(_ lat : String, _ long:  String) -> URLRequest?{
        guard let url = URL.init(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=fd1df67008f4eb111112571fb7fe1ea3") else { return nil }
        let req = URLRequest(url: url)
        return req
    }
}
