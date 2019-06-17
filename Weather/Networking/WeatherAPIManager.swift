//
//  WeatherAPIManager.swift
//  Weather
//
//  Created by Natanel Niazoff on 6/13/19.
//  Copyright © 2019 Natanel Niazoff. All rights reserved.
//

import Foundation
import Combine

struct WeatherAPIManager {
  private struct Constants {
    static let scheme = "https"
    static let host = "api.openweathermap.org"
    
    static let getForecastDataPath = "/data/2.5/forecast"
    
    static let apiKeyQueryItemName = "APPID"
    static let unitsQueryItemName = "units"
    
    static let unitsQueryItemImperialValue = "imperial"
    
    static let apiKeyEnvironmentKey = "API_KEY"
  }
  
  func getWeatherForecast() -> AnyPublisher<WeatherForecast, Error> {
    getForecastData()
      .map { $0.toWeatherForecast() }
      .eraseToAnyPublisher()
  }
  
  private func getForecastData() -> AnyPublisher<ForecastData, Error> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    return URLSession.shared.dataTaskPublisher(for: makeGetForecastDataURLRequest())
      .tryMap { data, response -> ForecastData in
        if let httpResponse = response as? HTTPURLResponse {
          guard case 100..<300 = httpResponse.statusCode else {
            throw WeatherAPIManagerError.serverError
          }
        }
        return try decoder.decode(ForecastData.self, from: data)
      }.eraseToAnyPublisher()
  }
  
  private func makeGetForecastDataURLRequest() -> URLRequest {
    var urlComponents = URLComponents()
    urlComponents.scheme = Constants.scheme
    urlComponents.host = Constants.host
    urlComponents.path = Constants.getForecastDataPath
    urlComponents.queryItems = [
      URLQueryItem(name: "zip", value: "10002"),
      URLQueryItem(name: Constants.unitsQueryItemName, value: Constants.unitsQueryItemImperialValue),
      URLQueryItem(name: Constants.apiKeyQueryItemName, value: ProcessInfo.processInfo.environment[Constants.apiKeyEnvironmentKey])
    ]
    
    guard let url = urlComponents.url else { preconditionFailure() }
    return URLRequest(url: url)
  }
}

enum WeatherAPIManagerError: Error {
  case serverError
}
