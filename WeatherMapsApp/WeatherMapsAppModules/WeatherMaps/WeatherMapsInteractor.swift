//
//  WeatherMapsInteractor.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 30/08/24.
//
import UIKit

protocol WeatherMapsInteractorProtocol {
    var presenter: WeatherMapsPresenterProtocol? {get set}
    func getLongittudeAndLattitude()
    
}

class WeatherMapsInteractor: WeatherMapsInteractorProtocol {
    var presenter: WeatherMapsPresenterProtocol?
    
    func getLongittudeAndLattitude() {
        
        guard let url = URL(string: "https://open-weather13.p.rapidapi.com/city/landon/EN?rapidapi-key=5a818edb79msh49dcdaece3f3bebp1a8177jsnbc89949b7f5e") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return  }
            
            do {
                let weather = try JSONDecoder().decode(WeatherMapsEntity.self, from: data)
                
                if let longitude = weather.coord.lon, let latitude = weather.coord.lat, let name = weather.name {
                    self?.presenter?.didRetriveLongitudeAndLattitude(with: longitude, and: latitude, name: name)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
