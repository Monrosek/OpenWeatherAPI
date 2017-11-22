//
//  OpenWeather.swift
//  OpenWeatherApp
//
//  Created by Mac on 11/20/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import Foundation

struct OpenWeather: Codable {
    var coord:Coord?
    var weather:[Weather]?
    var base:String?
    var main:Main?
    var wind:Wind?
    var clouds:Clouds?
    var id:Int?
    var name:String?
    var cod:Int?
}

struct Coord: Codable {
    var lon:Double?
    var lat:Double?
}

struct Weather: Codable {
    var id:Int?
    var main:String?
    var description:String?
    var icon:String?
}

struct Main: Codable {
    var temp:Double?
    var pressure:Int?
    var humidity:Int?
    var temp_min:Double?
    var temp_max:Double?
    var sea_level:Double?
    var grnd_level:Double?
}

struct Wind: Codable {
    var speed:Double?
    var deg:Double?
}

struct Clouds: Codable {
    var all:Double?
}

struct Rain: Codable {
    var vol3h:Double?
}

struct Snow: Codable {
    var vol3h:Double?
}

struct Sys: Codable {
    var type:Int?
    var id:Int?
    var message:Double?
    var country:String?
    var sunrise:Double?
    var sunset:Double?
}




