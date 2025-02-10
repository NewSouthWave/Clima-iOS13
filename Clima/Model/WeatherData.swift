//
//  WeatherData.swift
//  Clima
//
//  Created by Nam on 2/9/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {   //  Codable 프로토콜은 Decodable과 Encodable를 내포함
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
