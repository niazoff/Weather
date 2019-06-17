//
//  WeatherListViewModel.swift
//  Weather
//
//  Created by Natanel Niazoff on 6/14/19.
//  Copyright © 2019 Natanel Niazoff. All rights reserved.
//

import SwiftUI
import Combine

class WeatherListViewModel: BindableObject {
  let didChange = PassthroughSubject<WeatherListViewModel, Never>()
  
  private let calendar = Calendar.current
  private let apiManager = WeatherAPIManager()
  
  var title: String? {
    didSet { didChange.send(self) }
  }
  
  var weatherSectionViewModels = [WeatherSectionViewModel]() {
    didSet { didChange.send(self) }
  }
  
  func load() {
    _ = apiManager.getWeatherForecast().sink { forecast in
      DispatchQueue.main.async {
        self.title = forecast.location.name
        self.weatherSectionViewModels = self.makeWeatherSectionViewModels(weatherTimeline: forecast.weatherTimeline)
      }
    }
  }
  
  private func makeWeatherSectionViewModels(weatherTimeline: [Weather]) -> [WeatherSectionViewModel] {
    var weatherDateDictionary = [Date: [Weather]]()
    for weather in weatherTimeline {
      let date = calendar.startOfDay(for: weather.date)
      guard !calendar.isDate(date, inSameDayAs: Date()) else { continue }
      if weatherDateDictionary[date] != nil {
        weatherDateDictionary[date]?.append(weather)
      } else { weatherDateDictionary[date] = [weather] }
    }
    return weatherDateDictionary.mapValues { $0.map(WeatherViewModel.init) }
      .map(WeatherSectionViewModel.init).sorted()
  }
}
