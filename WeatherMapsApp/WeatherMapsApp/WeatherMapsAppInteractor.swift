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
    func saveData(with weather: WeatherResponse)
    func returnNumOfElements() -> Int
    func returnElements() -> [WeatherResponse]?
}

class WeatherMapsAppInteractor: WeatherMapsAppInteractorProtocol {
    var presenter: WeatherMapsAppPresenterProtocol?
    var dataArray: [WeatherResponse] = [WeatherResponse]()
    var numOfElements = 0
    
    func getWeather() {
        guard let url = URL(string: "https://open-weather13.p.rapidapi.com/city/mexico/EN?rapidapi-key=5a818edb79msh49dcdaece3f3bebp1a8177jsnbc89949b7f5e") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return  }
            
            do {
                let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                self?.presenter?.getDataFromService(with: weather)
                self?.saveData(with: weather)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func saveData(with weather: WeatherResponse) {
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
                let weatherData = try decoder.decode([WeatherResponse].self, from: data)
                
                return weatherData.count
                
            } catch {
                print("Unable to Decode Weather (\(error))")
            }
        }
        return 0
    }
    
    func returnElements() -> [WeatherResponse]? {
        if let data = UserDefaults.standard.data(forKey: "Weather") {
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode([WeatherResponse].self, from: data)
                
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
