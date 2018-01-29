//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 22/01/2018.
//  Copyright © 2018 Mohamed Ali. All rights reserved.
//

import Foundation
import SwiftyJSON

class Weather {
    
    let weather_name: String
    let city: String
    let description: String
    let wind_speed: Double
    let wind_deg: Double
    let temp: Double
    let humidity: Double
    let pressure: Double
    let temp_min: Double
    let temp_max: Double
    let icon: NSURL

    init(_ json: JSON) {
        self.weather_name = json["weather"][0]["main"].stringValue
        self.city = json["name"].stringValue
        self.description = json["weather"][0]["description"].stringValue
        self.wind_speed = json["wind"]["speed"].doubleValue
        self.wind_deg = json["wind"]["deg"].doubleValue
        self.humidity = json["main"]["humidity"].doubleValue
        self.pressure = json["main"]["pressure"].doubleValue
        self.temp = json["main"]["temp"].doubleValue
        self.temp_min = json["main"]["temp_min"].doubleValue
        self.temp_max = json["main"]["temp_max"].doubleValue
        self.icon = NSURL(string: "https://openweathermap.org/img/w/\(json["weather"][0]["icon"].stringValue).png")!
    }
    
}
