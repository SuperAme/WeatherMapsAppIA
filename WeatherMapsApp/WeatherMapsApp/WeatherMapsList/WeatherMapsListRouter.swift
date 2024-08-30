//
//  WeatherMapsListRouter.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 30/08/24.
//

import UIKit

protocol WeatherMapsListRouterProtocol {
    var entry: WeatherMapsListView? { get }
    
    static func startExecution() -> WeatherMapsListRouterProtocol
}

class WeatherMapsListRouter: WeatherMapsListRouterProtocol {
    var entry: WeatherMapsListView?
    
    static func startExecution() -> WeatherMapsListRouterProtocol {
        var view: WeatherMapsListView = WeatherMapsListView()
        var presenter = WeatherMapsListPresenter()
        let router = WeatherMapsListRouter()
        
        view.presenter = presenter
        
        
        router.entry = view
        return router
    }
}
