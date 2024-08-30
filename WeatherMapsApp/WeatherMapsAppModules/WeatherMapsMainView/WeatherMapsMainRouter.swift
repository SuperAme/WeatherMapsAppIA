//
//  WeatherMapsMainRouter.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 28/08/24.
//

import UIKit

protocol WeatherMapsAppRouterProtocol {
    var entry: WeatherMapsMainView? { get }
    static func startExecution() -> WeatherMapsAppRouterProtocol
    
    func goToListOfService(with weatherList: [WeatherMapsEntity]?)
    func goToWeatherMapsModule()
}

class WeatherMapsMainRouter: WeatherMapsAppRouterProtocol {
    var entry: WeatherMapsMainView?
    
    static func startExecution() -> WeatherMapsAppRouterProtocol {
        var view: WeatherMapsMainView = WeatherMapsMainView()
        
        var interactor = WeatherMapsMainInteractor()
        var presenter = WeatherMapsMainPresenter()
        let router = WeatherMapsMainRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view
        return router
    }
    
    func goToListOfService(with weatherList: [WeatherMapsEntity]?) {
        let router = WeatherMapsListRouter.startExecution(with: weatherList)
        let weatherListVc = router.entry!
        self.entry?.navigationController?.pushViewController(weatherListVc, animated: true)
        
        //self.entry?.present(weatherListVc, animated: true)
    }
    
    func goToWeatherMapsModule() {
        let router = WeatherMapsRouter.startExecution()
        let weatherMapsVc = router.entry!
        self.entry?.navigationController?.pushViewController(weatherMapsVc, animated: true)
    }
}
