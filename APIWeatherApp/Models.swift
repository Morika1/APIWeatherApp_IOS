//
//  City.swift
//  APIWeatherApp
//
//  Created by Mac on 06/12/2023.
//

import Foundation

struct City: Identifiable, Codable, Hashable{
    
    var id = UUID().uuidString
    var dt: Int64
    var main: CityDetails
    
    
    enum CodingKeys: String, CodingKey{
        case dt, main
    }
    
}

struct CityDetails: Codable, Hashable{
    
    var temp = 0.0
    var feels_like = 0.0
    var humidity = 0.0
    
    enum CodingKeys: String, CodingKey{
        case temp, feels_like, humidity
    }
    
    
}


