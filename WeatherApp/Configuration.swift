//
//  Configuration.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 28/01/2018.
//  Copyright © 2018 Mohamed Ali. All rights reserved.
//

import Foundation

let hostWeather = "https://api.openweathermap.org/data/2.5"
let weatherDispatcher = NetworkDispatcher(environment: Environment("WeatherEnv", host: hostWeather))
