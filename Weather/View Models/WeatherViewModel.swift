//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Natanel Niazoff on 6/14/19.
//  Copyright © 2019 Natanel Niazoff. All rights reserved.
//

import SwiftUI

struct WeatherViewModel: Identifiable {
  private let weather: Weather
  
  private var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
    return formatter
  }()
  
  var id: Int { Int(weather.date.timeIntervalSince1970 * 1000) }
  
  var icon: String? { weather.icon }
  var text: String { String(weather.temperature) }
  var descriptionText: String? { weather.description }
  var dateText: String { dateFormatter.string(from: weather.date) }
  
  init(weather: Weather) {
    self.weather = weather
  }
}
