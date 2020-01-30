//
//  WeatherManager.swift
//  Clima
//
//  Created by Ishaq Amin on 29/01/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?&appid=febfaeef1cf59282b2be8028479f99d6&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
        }
    
    func performRequest(urlString: String){

        //        1. Create URL
       if let url = URL(string: urlString){

        //        2. Create a URL Session
        let session = URLSession(configuration: .default)

        //        3.Give the session a task
        let task = session.dataTask(with: url) { (data, response, error) in
             if error != nil{
                       print(error!)
                       return
                   }
                   if let safeData = data{
                    self.parseJason(weatherData: safeData)
                       
        }
        }
        
        //        4.Start the task
        task.resume()
    }
}
    
    func parseJason(weatherData: Data){
        let decoder = JSONDecoder()
        do {
         let decodedData =  try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            print()
        } catch {
            print(error)
        }
    }

            
        }
    
