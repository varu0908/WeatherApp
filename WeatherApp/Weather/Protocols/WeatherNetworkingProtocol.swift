//
//  WeatherNetworkingProtocol.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import Foundation

protocol WeatherNetworkingProtocol {
    var manager : ApiProtocol { get set }
    func getWeatherData<T : Codable>(type : T.Type,lat : String,long : String, completion : @escaping (T?) -> Void)
}
