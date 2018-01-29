//
//  WeatherRequest.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 29/01/2018.
//  Copyright © 2018 Mohamed Ali. All rights reserved.
//

import Foundation
import SwiftyJSON

let api_key = "f01efb08f2981af0ad7243de9fa6bf33"

public enum WeatherRequests: Request {
    
    case getWheather(query: String)
    case forecast(query: String)
    
    public var path: String {
        switch self {
            case .getWheather(_):
                return "weather"
            case .forecast(_):
                return "forecast"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
            case .getWheather(_):
                return .get
            case .forecast(_):
                return .get
        }
    }
    
    public var parameters: RequestParams {
        switch self {
            case .getWheather(let query):
                return .url(["q" : query, "APPID": api_key, "units": "metric"])
            case .forecast(let query):
                return .url(["q" : query, "APPID": api_key, "units": "metric"])
        }
    }
    
    public var headers: [String : Any]? {
        switch self {
            default:
                return nil
        }
    }
    
    public var dataType: DataType {
        switch self {
            case .getWheather(_):
                return .JSON
            case .forecast(_):
                return .JSON
        }
    }
}
