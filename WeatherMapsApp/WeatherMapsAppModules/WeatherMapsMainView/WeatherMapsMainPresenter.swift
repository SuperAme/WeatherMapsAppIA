//
//  WeatherMapsMainPresenter.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 28/08/24.
//

import UIKit

protocol WeatherMapsAppPresenterProtocol {
    var view: WeatherMapsAppViewProtocol? { get set }
    var interactor: WeatherMapsAppInteractorProtocol? { get set }
    var router: WeatherMapsAppRouterProtocol? { get set }
    
    func didServiceButtonPressed()
    func getDataFromService(with weather: WeatherMapsEntity)
    func getStoredData()
    func goToDetailView(with weather: [WeatherMapsEntity]?)
    func goToWeatherMaps()
}

class WeatherMapsMainPresenter: WeatherMapsAppPresenterProtocol {
    var view: WeatherMapsAppViewProtocol?
    
    var interactor: WeatherMapsAppInteractorProtocol?
    
    var router: WeatherMapsAppRouterProtocol?
    
    func didServiceButtonPressed() {
        view?.showLoader()
        interactor?.getWeather()
    }
    
    func getDataFromService(with weather: WeatherMapsEntity) {
        view?.hideLoader()
    }
    
    func getStoredData() {
        let elements = interactor?.returnElements()
        goToDetailView(with: elements)
    }
    
    func goToDetailView(with weather: [WeatherMapsEntity]?) {
        router?.goToListOfService(with: weather)
    }
    
    func goToWeatherMaps() {
        router?.goToWeatherMapsModule()
    }
}
