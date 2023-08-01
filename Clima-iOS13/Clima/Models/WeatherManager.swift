//
//  WeatherManager.swift
//  Clima
//
//  Created by Амир Кайдаров on 12/18/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager : WeatherManager, weather : WeatherModel)
    func didFailWithError(error : Error)
}

struct WeatherManager{
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=2538842b84fcde94d04025341f51038b&units=metric"
    
    var delegate : WeatherManagerDelegate?
    
    func fetchWeather(cityName : String){
        let urlString = "\(url)&q=\(cityName)"
        performRequest(with : urlString)
    }
    
    func fetchWeather(longitude : Double, latitude : Double){
        let urlString = "\(url)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with : urlString)
    }
    
    func performRequest(with urlString : String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather : weather)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    
    func parseJSON(_ weatherData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let cityName = decodedData.name
            let conditionID = decodedData.weather[0].id
            let temperature = decodedData.main.temp
            
            let weather = WeatherModel(cityName : cityName, temperature : temperature, conditionID : conditionID)
            
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
}
