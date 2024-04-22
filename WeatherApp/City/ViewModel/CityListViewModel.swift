//
//  CityListViewModel.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import Foundation

class CityListViewModel : CityListViewModelProtocol {
  
    
    var cityNetworkManager: CityNetworkingProtocol
    var cityData: [City] = []
    var citySearchData: [City] = []

    var workItem : DispatchWorkItem?
    
    init (manager : CityNetworkingProtocol) {
        cityNetworkManager = manager
    }
    
    func getCities(completion: @escaping (Bool) -> Void) {
        self.cityNetworkManager.getCities(type: CityList.self) { model in
            self.cityData = model?.cities ?? []
            self.citySearchData = model?.cities ?? []
            completion(true)
        }
    }
    
    func getCellModelFor(index: Int) -> CityCellViewModel {
        return CityCellViewModel(city: self.citySearchData[index])
    }
    
    func getNumberOfItem() -> Int {
        return self.citySearchData.count
    }
    
    func search(text : String, handler : @escaping ()->Void){
        workItem?.cancel()
        print(text + " : Search")
        let queue = DispatchQueue.global()
        workItem = DispatchWorkItem(block: {
        print("Searching...... \(text)")
            if text == "" {
                self.citySearchData = self.cityData
                handler()
            }else {
                self.citySearchData = self.cityData.filter { city in
                    return city.city.lowercased().contains(text.lowercased())
                }
                handler()
            }
        })
        queue.asyncAfter(deadline: .now() + .seconds(Int(0.5)), execute: workItem!)
    }
    
    
}
