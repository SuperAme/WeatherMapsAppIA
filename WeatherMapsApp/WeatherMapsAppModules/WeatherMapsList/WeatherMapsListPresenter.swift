//
//  WeatherMapsListPresenter.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 30/08/24.
//

import Foundation

protocol WeatherMapsListPresenterProtocol {
    var view: WeatherMapsListViewProtocol? { get set }
    var interactor: WeatherMapsListInteractorProtocol? { get set }
    var router: WeatherMapsListRouterProtocol? { get set }

    func elements()
}

class WeatherMapsListPresenter: WeatherMapsListPresenterProtocol {
    var view: WeatherMapsListViewProtocol?
    
    var interactor: WeatherMapsListInteractorProtocol?
    
    var router: WeatherMapsListRouterProtocol?
    
    func elements() {
        let elements = interactor?.getListOfWeather()
        view?.update(with: elements)
    }
    
    
}
