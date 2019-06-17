//
//  URLSession+DataTaskPublisher.swift
//  Weather
//
//  Created by Natanel Niazoff on 6/13/19.
//  Copyright © 2019 Natanel Niazoff. All rights reserved.
//

import Foundation

extension URLSession {
  func dataTaskPublisher(for request: URLRequest) -> DataTaskPublisher {
    return DataTaskPublisher(session: self, request: request)
  }
}
