//
//  WeatherMapsListPresenter.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 30/08/24.
//

import Foundation

protocol WeatherMapsListPresenterProtocol {
    var view: WeatherMapsListView? {get set}

    func elements(_ weather: [WeatherResponse])
}

class WeatherMapsListPresenter: WeatherMapsListPresenterProtocol {
    var view: WeatherMapsListView?
    
    func elements(_ weather: [WeatherResponse]) {
        
    }
    
    
}
