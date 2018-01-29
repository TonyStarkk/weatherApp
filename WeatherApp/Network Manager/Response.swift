//
//  Response.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 28/01/2018.
//  Copyright © 2018 Mohamed Ali. All rights reserved.
//

import Foundation
import SwiftyJSON

public enum Response {
    case json(_: JSON)
    case data(_: Data)
    case error(_: Int?, _: Error?)
    
    init(_ response: (r: HTTPURLResponse?, data: Data?, error: Error?), for request: Request) {
        guard response.r?.statusCode == 200, response.error == nil else {
            self = .error(response.r?.statusCode, response.error)
            return
        }
        
        guard let data = response.data else {
            self = .error(response.r?.statusCode, NetworkErrors.noData)
            return
        }
        
        switch request.dataType {
            case .Data:
                self = .data(data)
            case .JSON:
                do {
                    self = .json(try JSON(data: data))
                    // do something with data
                    // if the call fails, the catch block is executed
                } catch {
                    self = .json(JSON())
                    print(error)
                }
        }
    }
}
