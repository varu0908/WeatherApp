//
//  Extensions.swift
//  WeatherApp
//
//  Created by Varsha Verma on 22/04/24.
//

import Foundation
import UIKit
import CoreLocation

extension Date{
    func getDate(formate : String)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date()) // string purpose I add here
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = formate
        return formatter.string(from: yourDate!)
    }
}

extension String{
    func getIcon(image : @escaping (UIImage?) -> Void){
        let url =  URL.init(string: self)
        do{
            let data = try Data(contentsOf: url!)
            image(UIImage(data: data))
        }catch{
            image(nil)
        }
    }
    
    func KelvinToDegree() -> String {
        let res = Int(((Double(self) ?? 0)-273.15))
       return "\(res)°C"
    }
}

extension UIView {
    func cornerRadius(radius : Int) {
        self.layer.cornerRadius = CGFloat(radius)
        self.clipsToBounds = true
    }
}

extension String {
    func metersToKilometers() -> String {
        return "\((Double(self) ?? 0.0) / 1000.0)"
    }
    
    func metersPerSecondToKilometersPerHour() -> String? {
        // Convert string to Double
        guard let metersPerSecond = Double(String(self)) else {
            return ""
        }
        // Convert meters per second to kilometers per hour
        let kilometersPerHour = metersPerSecond * 3.6
        return "\(kilometersPerHour)"
    }
}

extension Double {
    func metersToKilometers() -> Double {
        return self / 1000.0
    }
}

extension CLLocationSpeed {
    func toKmM() -> String {
        return "\(self * 3 / 50)"
    }
}
