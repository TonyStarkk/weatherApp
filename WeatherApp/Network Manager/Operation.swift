//
//  Operation.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 28/01/2018.
//  Copyright © 2018 Mohamed Ali. All rights reserved.
//

import Foundation
import Hydra

protocol Operation {
    associatedtype Output
    
    /// Request to execute
    var request: Request { get }
    
    
    /// Execute request in passed dispatcher
    ///
    /// - Parameter dispatcher: dispatcher
    /// - Returns: a promise
    func execute(in dispatcher: Dispatcher) -> Promise<Output>
    
}
