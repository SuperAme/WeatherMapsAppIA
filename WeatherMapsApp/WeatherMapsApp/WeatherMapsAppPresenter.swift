//
//  WeatherMapsAppPresenter.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 28/08/24.
//

import UIKit

protocol WeatherMapsAppPresenterProtocol {
    var view: WeatherMapsAppViewProtocol? { get set }
    var interactor: WeatherMapsAppInteractorProtocol? { get set }
    var router: WeatherMapsAppRouterProtocol? { get set }
    
    func viewDidLoad()
    func didServiceButtonPressed()
    func getDataFromService(with weather: WeatherResponse)
    func getStoredData()
    func goToDetailView()
    func sendData(_ weather: [WeatherResponse])
}

class WeatherMapsAppPresenter: WeatherMapsAppPresenterProtocol {
    func sendData(_ weather: [WeatherResponse]) {
        
    }
    
    var view: WeatherMapsAppViewProtocol?
    
    var interactor: WeatherMapsAppInteractorProtocol?
    
    var router: WeatherMapsAppRouterProtocol?
    
    func viewDidLoad() {
    }
    
    func didServiceButtonPressed() {
        interactor?.getWeather()
    }
    
    func getDataFromService(with weather: WeatherResponse) {
        
    }
    
    func getStoredData() {
        let elements = interactor?.returnElements()
        goToDetailView()
    }
    
    func goToDetailView() {
        router?.goToListOfService()
    }
}
