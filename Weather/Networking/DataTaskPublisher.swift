//
//  DataTaskPublisher.swift
//  Weather
//
//  Created by Natanel Niazoff on 6/13/19.
//  Copyright © 2019 Natanel Niazoff. All rights reserved.
//

import Foundation
import Combine

struct DataTaskPublisher: Publisher {
  typealias Output = (data: Data, response: URLResponse)
  typealias Failure = URLError
  
  let session: URLSession
  let request: URLRequest
  
  public func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
    let task = session.dataTask(with: request) { data, response, error in
      guard let data = data, let response = response else {
        guard let error = error, let urlError = error as? URLError
          else { fatalError() }
        subscriber.receive(completion: .failure(urlError))
        return
      }
      _ = subscriber.receive((data, response))
      subscriber.receive(completion: .finished)
    }
    subscriber.receive(subscription: DataTaskSubscription(task: task))
    task.resume()
  }
}
