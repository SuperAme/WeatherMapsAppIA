//
//  WeatherMapsPresenter.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 30/08/24.
//

import UIKit

protocol WeatherMapsPresenterProtocol {
    var view: WeatherMapsViewProtocol? { get set }
    var interactor: WeatherMapsInteractorProtocol? { get set }
    var router: WeatherMapsRouterProtocol? { get set }
    
    func viewDidLoad()
    func didRetriveLongitudeAndLattitude(with longitude: Double, and latitude: Double, name: String)
}

class WeatherMapsPresenter: WeatherMapsPresenterProtocol {
    var view: WeatherMapsViewProtocol?
    
    var interactor: WeatherMapsInteractorProtocol?
    
    var router: WeatherMapsRouterProtocol?
    
    func viewDidLoad() {
        view?.showLoader()
        interactor?.getLongittudeAndLattitude()
    }
    
    func didRetriveLongitudeAndLattitude(with longitude: Double, and latitude: Double, name: String) {
        view?.hideLoader()
        view?.layoutMap(with: longitude, and: latitude, name: name)
    }
}

