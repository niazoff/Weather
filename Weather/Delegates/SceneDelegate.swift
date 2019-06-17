//
//  SceneDelegate.swift
//  Weather
//
//  Created by Natanel Niazoff on 6/13/19.
//  Copyright © 2019 Natanel Niazoff. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    self.window = makeWindow()
    window?.makeKeyAndVisible()
  }
  
  private func makeWindow() -> UIWindow {
    let window = UIWindow(frame: UIScreen.main.bounds)
    let viewModel = WeatherListViewModel()
    viewModel.load()
    let rootView = WeatherListView(viewModel: viewModel)
    window.rootViewController = UIHostingController(rootView: rootView)
    return window
  }
}

