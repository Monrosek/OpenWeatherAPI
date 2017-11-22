//
//  Enums.swift
//  OpenWeatherApp
//
//  Created by Mac on 11/20/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import Foundation


enum NetworkError:Error{
    case InvalidURL
    case NoDataOnServer
    case DataContainedNoObject
}

enum pageViewType {
    case intro
    case temp
    case cloud
}

