//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Varsha Verma on 15/04/24.
//

import UIKit
import GooglePlaces

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       // GMSPlacesClient.provideAPIKey("AIzaSyCUfY7OK3B70e_sNv4TXUxXpawRJ4CA168")
        GMSPlacesClient.provideAPIKey("AIzaSyAeSNhEIw5XV2gp0PFJMr2jee6FcKEW8Zs")
        //AIzaSyAR8mt4EIvGipcov5o_39bi5CM87qhAs5Q
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

