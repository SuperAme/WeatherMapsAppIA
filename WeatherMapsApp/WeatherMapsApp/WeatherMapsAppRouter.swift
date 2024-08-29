//
//  WeatherMapsAppRouter.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 28/08/24.
//

import UIKit

protocol WeatherMapsAppRouterProtocol {
    var entry: WeatherMapsAppView? { get }
    static func startExecution() -> WeatherMapsAppRouterProtocol
}

class WeatherMapsAppRouter: WeatherMapsAppRouterProtocol {
    var entry: WeatherMapsAppView?
    
    static func startExecution() -> WeatherMapsAppRouterProtocol {
        let mainStoryBoard = UIStoryboard(name: "MainWeatherMapAppView", bundle: nil)
        let view = mainStoryBoard.instantiateViewController(withIdentifier: "WeatherMapsAppViewId") as! WeatherMapsAppView
        
        let router = WeatherMapsAppRouter()
        
        router.entry = view
        return router
    }
    
    
}
