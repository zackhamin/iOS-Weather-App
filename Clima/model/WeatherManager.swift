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
                       let dataString = String(data: safeData, encoding: .utf8)
                       print(dataString)
        }
        }
        
        //        4.Start the task
        task.resume()
    }
}

}
