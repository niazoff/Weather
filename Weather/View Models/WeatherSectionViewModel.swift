//
//  WeatherSectionViewModel.swift
//  Weather
//
//  Created by Natanel Niazoff on 6/16/19.
//  Copyright © 2019 Natanel Niazoff. All rights reserved.
//

import SwiftUI

struct WeatherSectionViewModel: Identifiable {
  private let calendar = Calendar.current
  
  private let date: Date
  let viewModels: [WeatherViewModel]
  
  private var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE"
    return formatter
  }()
  
  var id: Int { Int(date.timeIntervalSince1970 * 1000) }
  
  var text: String {
    calendar.isDate(date, inSameDayAs: Date()) ? Constants.todayDateText : dateFormatter.string(from: date)
  }
  
  private struct Constants {
    static let todayDateText = "Today"
  }
  
  init(date: Date,
       viewModels: [WeatherViewModel]) {
    self.date = date
    self.viewModels = viewModels
  }
}

extension WeatherSectionViewModel: Equatable {
  static func == (lhs: WeatherSectionViewModel, rhs: WeatherSectionViewModel) -> Bool {
    lhs.date == rhs.date
  }
}

extension WeatherSectionViewModel: Comparable {
  static func < (lhs: WeatherSectionViewModel, rhs: WeatherSectionViewModel) -> Bool {
    lhs.date < rhs.date
  }
}
