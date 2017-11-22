//
//  APIService.swift
//  OpenWeatherApp
//
//  Created by Mac on 11/20/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import Foundation

struct API {
    static let root = "https://api.openweathermap.org/data/2.5/weather?"
    static let key = "&appid=9bcf638f753c4a97d9b0ccb5622af598"
    var zip:String
    
    public var country:String {
        return ",us"
    }
    
    public var url: String {
        return "\(API.root)\(zip)\(country)\(API.key)"
    }
    
    init(_ zip: Int) {
        self.zip = "zip=\(zip)"
    }
    

    static func getWeather(byZipcode zip: Int,completionHandler:@escaping(OpenWeather?,Error?)->()){
        guard let url = URL(string: API(zip).url) else {
            completionHandler(nil, NetworkError.InvalidURL)
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            guard let data = data else {
                completionHandler(nil, NetworkError.NoDataOnServer)
                return
            }
            guard let openW = OpenWeather(from: data) else {
                completionHandler(nil, NetworkError.DataContainedNoObject)
                return
            }
            completionHandler(openW, nil)
        }
        task.resume()
    }
}
