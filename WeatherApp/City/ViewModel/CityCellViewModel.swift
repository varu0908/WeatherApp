//
//  CityCellViewModel.swift
//  WeatherApp
//
//  Created by Varsha Verma on 22/04/24.
//

import Foundation

struct CityCellViewModel{
    private var city : City
    
    init(city: City) {
        self.city = city
    }
    
    var name : String{
        return self.city.city
    }
    
    var lat : String{
        return "\(self.city.latitude)"
    }
    
    var long : String{
        return "\(self.city.longitude)"
    }
}
