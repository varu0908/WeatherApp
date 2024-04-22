//
//  CityNetworkingProtocol.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import Foundation

protocol CityNetworkingProtocol {
    var manager : ApiProtocol { get set }
    func getCities<T : Codable>(type : T.Type, completion : @escaping (T?) -> Void)
}
