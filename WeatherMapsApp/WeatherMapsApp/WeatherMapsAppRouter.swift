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
    
    func goToListOfService()
}

class WeatherMapsAppRouter: WeatherMapsAppRouterProtocol {
    var entry: WeatherMapsAppView?
    
    static func startExecution() -> WeatherMapsAppRouterProtocol {
        var view: WeatherMapsAppView = WeatherMapsAppView()
        
        var interactor = WeatherMapsAppInteractor()
        var presenter = WeatherMapsAppPresenter()
        let router = WeatherMapsAppRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view
        return router
    }
    
    func goToListOfService() {
        let router = WeatherMapsListRouter.startExecution()
        let weatherListVc = router.entry!
        
        self.entry?.present(weatherListVc, animated: true)
    }
}
