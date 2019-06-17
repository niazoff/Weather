//
//  WeatherView.swift
//  Weather
//
//  Created by Natanel Niazoff on 6/13/19.
//  Copyright © 2019 Natanel Niazoff. All rights reserved.
//

import SwiftUI

struct WeatherView: View {
  var viewModel: WeatherViewModel
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        HStack(alignment: .center) {
          viewModel.icon.map {
            Text(verbatim: $0)
              .font(.largeTitle)
          }
          Text(verbatim: viewModel.text)
            .font(.title)
        }
        viewModel.descriptionText.map {
          Text(verbatim: $0.capitalized).font(.subheadline)
        }
      }
      Spacer()
      Text(verbatim: viewModel.dateText)
        .color(.gray)
    }
  }
}

//#if DEBUG
//struct WeatherView_Previews: PreviewProvider {
//  static var previews: some View {
//    WeatherView()
//  }
//}
//#endif
