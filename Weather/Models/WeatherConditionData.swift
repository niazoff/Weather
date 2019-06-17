//
//  WeatherConditionData.swift
//  Weather
//
//  Created by Natanel Niazoff on 6/16/19.
//  Copyright © 2019 Natanel Niazoff. All rights reserved.
//

import Foundation

struct WeatherConditionData: Codable {
  let id: Int
  let main: String
  let description: String
}

extension WeatherConditionData {
  var icon: String? {
    switch id {
    case 200..<300: return "🌩"
    case 300..<400: return "🌧"
    case 500..<600: return "🌧"
    case 600..<700: return "🌨"
    case 700..<800: return "🌫"
    case 800: return "☀️"
    case 801..<810: return "☁️"
    default: return nil
    }
  }
}
