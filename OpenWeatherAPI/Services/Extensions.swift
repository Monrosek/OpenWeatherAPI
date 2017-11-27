//
//  Extensions.swift
//  OpenWeatherApp
//
//  Created by Mac on 11/20/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

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

extension UIColor {
    convenience init(red: Int,green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(_ rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


