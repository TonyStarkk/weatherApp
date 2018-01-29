//
//  WeatherTask.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 29/01/2018.
//  Copyright © 2018 Mohamed Ali. All rights reserved.
//

import Foundation
import Hydra
import SwiftyJSON

class WeatherTask: Operation {
    
    var query: String
    
    init(query: String) {
        self.query = query
    }
    
    var request: Request {
        return WeatherRequests.getWheather(query: self.query)
    }
    
    /// Execute request in passed dispatcher
    ///
    /// - Parameter dispatcher: dispatcher
    /// - Returns: a promise
    func execute(in dispatcher: Dispatcher) -> Promise<Weather> {
        return Promise<Weather>({ resolve, reject,_  in
            do {
                try dispatcher.execute(request: self.request).then({ response in
                    switch response {
                        case .json(let json):
                            let weather = Weather(json)
                            resolve(weather)
                        break
                    case .error(_, let error):
                        print(error.debugDescription)
                        reject(error!)
                        break
                    case .data(_):
                        break
                    }
                }).catch(reject)
            } catch {
                reject(error)
            }
        })
    }
}
