//
//  Extensions.swift
//  OpenWeatherApp
//
//  Created by Mac on 11/20/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import Foundation

extension OpenWeather {
    
    init?(from data: Data) {
        do{
            let json = try JSONDecoder().decode(OpenWeather.self, from: data)
            self.coord = json.coord
            self.weather = json.weather
            self.base = json.base
            self.main = json.main
            self.wind = json.wind
            self.clouds = json.clouds
            self.id = json.id
            self.name = json.name
            self.cod = json.cod
            return
        }
        catch let error {
            print("Failed to decode OpenWeather JSON: \(error.localizedDescription)")
        }
        return nil
    }
}

