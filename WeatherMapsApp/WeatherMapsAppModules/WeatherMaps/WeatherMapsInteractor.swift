//
//  WeatherMapsInteractor.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 30/08/24.
//
import UIKit

protocol WeatherMapsInteractorProtocol {
    var presenter: WeatherMapsPresenterProtocol? {get set}
    func getLongitudeAndLatitude()
    
}

class WeatherMapsInteractor: WeatherMapsInteractorProtocol {
    var presenter: WeatherMapsPresenterProtocol?
    var dataArray: [WeatherMapsEntity] = [WeatherMapsEntity]()
    var numOfElements = 0
    
    func getLongitudeAndLatitude() {
        
        guard let url = URL(string: "https://open-weather13.p.rapidapi.com/city/landon/EN?rapidapi-key=5a818edb79msh49dcdaece3f3bebp1a8177jsnbc89949b7f5e") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return  }
            
            do {
                let weather = try JSONDecoder().decode(WeatherMapsEntity.self, from: data)
                
                if let longitude = weather.coord.lon, let latitude = weather.coord.lat, let name = weather.name {
                    self?.saveData(with: weather)
                    self?.presenter?.didRetriveLongitudeAndLattitude(with: longitude, and: latitude, name: name)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func saveData(with weather: WeatherMapsEntity) {
        let arrayElementsCounter = returnNumOfElements()
        do {
            let encoder = JSONEncoder()
            var data = Data()
            
            if arrayElementsCounter > 0 {
                var storedElements = returnElements()
                storedElements?.append(weather)
                data = try encoder.encode(storedElements)
            } else {
                data = try encoder.encode([weather])
            }
            UserDefaults.standard.set(data, forKey: "Weather")
        } catch  {
            print("Unable to Encode Weather (\(error))")
        }
    }
    
    func returnNumOfElements() -> Int {
        if let data = UserDefaults.standard.data(forKey: "Weather") {
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode([WeatherMapsEntity].self, from: data)
                
                return weatherData.count
                
            } catch {
                print("Unable to Decode Weather (\(error))")
            }
        }
        return 0
    }
    
    func returnElements() -> [WeatherMapsEntity]? {
        if let data = UserDefaults.standard.data(forKey: "Weather") {
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode([WeatherMapsEntity].self, from: data)
                
                for element in weatherData {
                    dataArray.append(element)
                }
                
                return weatherData
            } catch {
                print("Unable to Decode Weather (\(error))")
            }
        }
        return nil
    }
}
