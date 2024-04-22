//
//  WeatherNetworking.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import Foundation

class WeatherNetworking : WeatherNetworkingProtocol {

    var manager: ApiProtocol 
    
    init(manager : ApiProtocol) {
        self.manager = manager
    }
    
    func getWeatherData<T>(type: T.Type, lat : String,long : String, completion: @escaping (T?) -> Void) where T : Decodable, T : Encodable {
        let urlRequest = RequestFactory.shared.getWeather(lat, long)
        self.manager.hitGetApi(urlRequest) { data, response, error in
            if let data = data {
                // Decode
                do {
                    let jsonDecoder = JSONDecoder()
                    
                    let x =  try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    print(x)

                    let WeatherModel = try jsonDecoder.decode(T.self, from: data)
                    completion(WeatherModel)
                }catch {
                    print(error)
                    completion(nil)
                }
            }
        }
    }
}
