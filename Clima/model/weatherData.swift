//
//  weatherData.swift
//  Clima
//
//  Created by Ishaq Amin on 30/01/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
    
struct WeatherData: Decodable{
    let name:String
    let main: Main
    let weather: [weatherDescription]
}

struct Main: Decodable{
    let temp: Double
    
}

struct weatherDescription: Decodable{
    let description: String
}
