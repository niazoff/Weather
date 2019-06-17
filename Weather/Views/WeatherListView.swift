//
//  WeatherListView.swift
//  Weather
//
//  Created by Natanel Niazoff on 6/14/19.
//  Copyright © 2019 Natanel Niazoff. All rights reserved.
//

import SwiftUI

struct WeatherListView: View {
  @ObjectBinding var viewModel: WeatherListViewModel
  
  private struct Constants {
    static let titleText = "Weather"
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.weatherSectionViewModels) { sectionViewModel in
          Section(header: Text(sectionViewModel.text)) {
            ForEach(sectionViewModel.viewModels) { weatherViewModel in
              WeatherView(viewModel: weatherViewModel)
            }
          }
        }
      }.navigationBarTitle(Text(viewModel.title ?? Constants.titleText))
    }
  }
}

//#if DEBUG
//struct WeatherListView_Previews : PreviewProvider {
//  static var previews: some View {
//    WeatherListView()
//  }
//}
//#endif
