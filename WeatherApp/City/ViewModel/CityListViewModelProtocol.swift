//
//  CityViewModelProtocol.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import Foundation

protocol CityListViewModelProtocol {
    var cityNetworkManager : CityNetworkingProtocol { get set }
    var cityData : [City] { get set }
    var citySearchData : [City] { get set }
    func getCities(completion : @escaping (Bool) -> Void)
    func search(text : String, handler : @escaping ()->Void)
    func getCellModelFor(index : Int) -> CityCellViewModel
    func getNumberOfItem()->Int
}
