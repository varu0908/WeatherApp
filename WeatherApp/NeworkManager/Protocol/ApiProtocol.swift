//
//  ApiProtocol.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import Foundation

protocol ApiProtocol {
    typealias Response = (_ data: Data?,_ response : URLResponse?,_ error : Error?) -> Void
    func hitGetApi(_ urlReq : URLRequest?, response : @escaping Response)
    
    func getDataFromJSON(_ url : URL?,_ response : @escaping Response)

}
