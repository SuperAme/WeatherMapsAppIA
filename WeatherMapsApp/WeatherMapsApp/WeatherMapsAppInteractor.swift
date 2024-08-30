//
//  WeatherMapsAppInteractor.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 28/08/24.
//

import Foundation

protocol WeatherMapsAppInteractorProtocol {
    var presenter: WeatherMapsAppPresenterProtocol? { get set }
    
    func getWeather()
}

class WeatherMapsAppInteractor: WeatherMapsAppInteractorProtocol {
    var presenter: WeatherMapsAppPresenterProtocol?
    
    func getWeather() {
        guard let url = URL(string: "https://open-weather13.p.rapidapi.com/city/landon/EN?rapidapi-key=5a818edb79msh49dcdaece3f3bebp1a8177jsnbc89949b7f5e") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return  }
            
            do {
                let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                print(weather)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
