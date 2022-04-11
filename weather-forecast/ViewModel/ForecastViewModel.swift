//
//  ForecastViewModel.swift
//  weather-forecast
//
//  Created by Kenz on 11/04/2022.
//

import Combine
import SwiftUI

class ForecastViewModel: ObservableObject {
    var publisher: AnyCancellable?
    @Published var weatherForecast: Forecast?
    @Published var searchText = "saigon"
    var weatherService: Service
    
    var currentCity: String {
        if let city = weatherForecast?.city.name {
            return city
        } else {
            return ""
        }
    }
    var currentCountry: String {
        if let country = weatherForecast?.city.country {
            return country
        } else {
            return ""
        }
    }
    var day: String {
        if let day = weatherForecast?.list.first?.dt {
            let formattedDay = Helper().timeConverter(timeStamp: day, isDay: false)
            return formattedDay
        } else {
            return ""
        }
    }
    var temperature: String {
        if let temp = weatherForecast?.list.first?.temp?.day {
            let formatted = String(format: "%.0f", temp)
            return formatted + "degrees"
        } else {
            return ""
        }
    }
    var description: String {
        if let description = weatherForecast?.list.first?.weather?.first?.description {
            return description.capitalized(with: .current)
        } else {
            return ""
        }
    }
    var currentCondition: Forecast.Day.Weather {
        if let condition = weatherForecast?.list.first?.weather?.first {
            return condition
        } else {
            return Forecast.Day.Weather()
        }
    }
    var windSpeed: String {
        if let wind = weatherForecast?.list.first?.speed {
            let formatted = String(format: "%.1f", wind)
            return "\(formatted)mi/h"
        } else {
            return ""
        }
    }
    var humidity: String {
        if let hum = weatherForecast?.list.first?.humidity {
            return String(hum)
        } else {
            return ""
        }
    }
    var maxTemp: String {
        if let max = weatherForecast?.list.first?.temp?.max {
            let formatted = String(format: "%.0f", max)
            return formatted
        } else {
            return ""
        }
    }
    
    init() {
        weatherService = Service()
        self.publisher = $searchText
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { (str) in
                self.searchCity()
            })
    }
    
    func searchCity() {
        if let city = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeatherForecast(by: city)
        }
    }
    
    func fetchWeatherForecast(by city: String) {
        weatherService.getWeatherData(city: city) { (forecast) in
            DispatchQueue.main.async {
                self.weatherForecast = forecast
            }
        }
    }
    
    func getForecastList() -> [Forecast.Day] {
        if let mList = weatherForecast?.list {
            return mList
        } else {
            return []
        }
    }
}

