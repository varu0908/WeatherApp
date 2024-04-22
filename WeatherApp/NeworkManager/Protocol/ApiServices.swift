//
//  ApiServices.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import Foundation

class ApiService : ApiProtocol {
    func getDataFromJSON(_ url: URL?, _ response: @escaping Response) {
        guard let path = url else {
            print("Invalid URL")
            return
        }
        do {
            let data = try Data(contentsOf: path, options: .mappedIfSafe)
            response(data,nil,nil)
        } catch {
            // handle error
            response(nil,nil,error)
        }
    }
    
    func hitGetApi(_ urlReq: URLRequest?, response: @escaping Response) {
        guard let request = urlReq else{
            print("Invalid Request....")
            return
        }
        
        var session = URLSession.shared.dataTask(with: request) { data, resp, error in
            response(data,resp,error)
        }
        session.resume()
    }
}
