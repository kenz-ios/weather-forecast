//
//  ContentView.swift
//  weather-forecast
//
//  Created by Kenz on 11/04/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var forecastModel: ForecastViewModel
    @State var showField: Bool = true
    
    init() {
        forecastModel = ForecastViewModel()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(forecastModel.getForecastList(), id: \.dt) { day in
                    DayView(forecast: day)
                }
            }
            .searchable(text: $forecastModel.searchText)
            .navigationTitle("Weather Forecast")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

