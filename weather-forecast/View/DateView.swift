//
//  DateView.swift
//  weather-forecast
//
//  Created by Kenz on 11/04/2022.
//

import SwiftUI

struct DayView: View {
    let forecast: Forecast.Day
    
    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                Spacer()
                AsyncImage(url: forecast.url)
                    .frame(width: Constant.width, height: Constant.width)
                    .padding()
            }
            VStack (alignment: .leading) {
                HStack {
                    Text(forecast.dayString)
                    Spacer()
                }
                HStack {
                    Text(forecast.tempAveString)
                }
                HStack {
                    Text(forecast.pressureString)
                }
                HStack {
                    Text(forecast.humidityString)
                }
                HStack {
                    Text(forecast.weatherDescription)
                }
            }.padding(.leading, Constant.padding).padding(.trailing, Constant.padding)
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(forecast: Forecast.Day())
    }
}

