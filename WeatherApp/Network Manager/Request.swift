//
//  Request.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 28/01/2018.
//  Copyright © 2018 Mohamed Ali. All rights reserved.
//

import Foundation


/// Define the type of data we expect as response
///
/// - JSON: it's a json
/// - Data: it's plain data
public enum DataType {
    case JSON
    case Data
}

public protocol Request {
    var path            : String                { get }
    
    var method        : HTTPMethod            { get }
    
    var parameters    : RequestParams            { get }
    
    var headers        : [String: Any]?        { get }
    
    var dataType        : DataType                { get }
}


/// This define the type of HTTP method used to perform the request
public enum HTTPMethod: String {
    case post   = "POST"
    case put    = "PUT"
    case get    = "GET"
    case delete = "DELETE"
    case patch  = "PATCH"
}


/// - body: part of the body stream
/// - url: as url parameters
public enum RequestParams {
    case body(_ : [String: Any]?)
    case url(_ : [String: Any]?)
}
