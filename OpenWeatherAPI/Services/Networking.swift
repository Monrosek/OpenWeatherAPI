//
//  Networking.swift
//  OpenWeatherAPI
//
//  Created by Mac on 11/21/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import Foundation

class Dispatch {
    static let shared = Dispatch()
    let group = DispatchGroup()
}



class NetworkService {
    class func getWeather(zip:Int,completionHandler:@escaping(OpenWeather?,Error?)->()){
        guard let url = URL(string:API(zip).url) else {
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
            // print(String(data: data, encoding: .utf8) ?? "nothing")
            guard let openW = OpenWeather(from: data) else {
                completionHandler(nil, NetworkError.DataContainedNoObject)
                return
            }
            completionHandler(openW, nil)
        }
        task.resume()
    }
}
