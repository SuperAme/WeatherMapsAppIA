//
//  WeatherMapsListRouter.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 30/08/24.
//

import UIKit

protocol WeatherMapsListRouterProtocol {
    var entry: WeatherMapsListView? { get }
    
    static func startExecution(with weatherList: [WeatherMapsEntity]?) -> WeatherMapsListRouterProtocol
}

class WeatherMapsListRouter: WeatherMapsListRouterProtocol {
    var entry: WeatherMapsListView?
    
    static func startExecution(with weatherList: [WeatherMapsEntity]?) -> WeatherMapsListRouterProtocol {
        var view: WeatherMapsListView = WeatherMapsListView()
        
        var interactor = WeatherMapsListInteractor()
        var presenter = WeatherMapsListPresenter()
        let router = WeatherMapsListRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        interactor.entity = weatherList
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view
        return router
    }
}
