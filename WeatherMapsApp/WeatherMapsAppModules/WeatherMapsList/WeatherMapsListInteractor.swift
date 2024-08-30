//
//  WeatherMapsListInteractor.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 30/08/24.
//

protocol WeatherMapsListInteractorProtocol {
    var presenter: WeatherMapsListPresenterProtocol? {get set}
    var entity: [WeatherMapsEntity]? {get set}
    
    func getListOfWeather() -> [WeatherMapsEntity]?
}

class WeatherMapsListInteractor: WeatherMapsListInteractorProtocol {
    var presenter: WeatherMapsListPresenterProtocol?
    
    var entity: [WeatherMapsEntity]?
    
    func getListOfWeather() -> [WeatherMapsEntity]? {
        return entity
    }
}

