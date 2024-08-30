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
}

class WeatherMapsAppPresenter: WeatherMapsAppPresenterProtocol {
    var view: WeatherMapsAppViewProtocol?
    
    var interactor: WeatherMapsAppInteractorProtocol?
    
    var router: WeatherMapsAppRouterProtocol?
    
    func viewDidLoad() {
    }
    
    func didServiceButtonPressed() {
        interactor?.getWeather()
    }
}
