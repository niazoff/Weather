//
//  CityData.swift
//  Weather
//
//  Created by Natanel Niazoff on 6/16/19.
//  Copyright © 2019 Natanel Niazoff. All rights reserved.
//

import Foundation

struct CityData: Codable {
  let name: String
}

extension CityData {
  func toWeatherLocation() -> WeatherLocation {
    WeatherLocation(name: self.name)
  }
}
