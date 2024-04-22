//
//  CityNetworking.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import Foundation

class CityNetworking : CityNetworkingProtocol {
    var manager: ApiProtocol
    
    init(manager : ApiProtocol) {
        self.manager = manager
    }
    
    func getCities<T : Codable>(type: T.Type, completion: @escaping (T?) -> Void) {
        let url = RequestFactory.shared.getRequestCityList()
        self.manager.getDataFromJSON(url) { data, response, error in
            if let data = data {
                // Decode
                do {
                    let jsonDecoder = JSONDecoder()
                    let city = try jsonDecoder.decode(T.self, from: data)
                    completion(city)
                }catch {
                    print("Error")
                    completion(nil)
                }
            }
        }
    }
}
