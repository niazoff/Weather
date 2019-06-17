//
//  ForecastData.swift
//  Weather
//
//  Created by Natanel Niazoff on 6/13/19.
//  Copyright © 2019 Natanel Niazoff. All rights reserved.
//

import Foundation

struct ForecastData: Codable {
  let list: [ListItem]
  let city: CityData
  
  struct ListItem: Codable {
    let date: Date
    let mainDetails: MainDetails
    let weatherConditions: [WeatherConditionData]
    
    enum CodingKeys: String, CodingKey {
      case date = "dt"
      case mainDetails = "main"
      case weatherConditions = "weather"
    }
    
    struct MainDetails: Codable {
      let temperature: Double
      
      enum CodingKeys: String, CodingKey {
        case temperature = "temp"
      }
    }
  }
}

extension ForecastData {
  func toWeatherForecast() -> WeatherForecast {
    WeatherForecast(
      location: city.toWeatherLocation(),
      weatherTimeline: self.list.map {
        Weather(
          date: $0.date,
          temperature: Int($0.mainDetails.temperature.rounded()),
          description: $0.weatherConditions.first?.description,
          icon: $0.weatherConditions.first?.icon
        )
    })
  }
}
