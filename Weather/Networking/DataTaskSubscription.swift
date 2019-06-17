//
//  DataTaskSubscription.swift
//  Weather
//
//  Created by Natanel Niazoff on 6/13/19.
//  Copyright © 2019 Natanel Niazoff. All rights reserved.
//

import Foundation
import Combine

struct DataTaskSubscription: Subscription {
  let combineIdentifier: CombineIdentifier
  let task: URLSessionTask
  
  init(combineIdentifier: CombineIdentifier = CombineIdentifier(),
       task: URLSessionTask) {
    self.combineIdentifier = combineIdentifier
    self.task = task
  }
  
  func request(_ demand: Subscribers.Demand) {}
  
  func cancel() { task.cancel() }
}
