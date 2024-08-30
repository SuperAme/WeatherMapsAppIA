//
//  WeatherMapsRouter.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 30/08/24.
//

import UIKit

protocol WeatherMapsRouterProtocol {
    var entry: WeatherMapsView? { get }
    
    static func startExecution() -> WeatherMapsRouterProtocol
}

class WeatherMapsRouter: WeatherMapsRouterProtocol {
    var entry: WeatherMapsView?
    
    static func startExecution() -> WeatherMapsRouterProtocol {
        var view: WeatherMapsView = WeatherMapsView()
        
        var interactor = WeatherMapsInteractor()
        var presenter = WeatherMapsPresenter()
        let router = WeatherMapsRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view
        return router
    }
}
