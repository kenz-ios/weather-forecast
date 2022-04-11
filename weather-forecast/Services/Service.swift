//
//  Service.swift
//  weather-forecast
//
//  Created by Kenz on 11/04/2022.
//

import Foundation

class Service {
    func getWeatherData(city: String, _ completion: @escaping (Forecast) -> Void) {
        let url = URL(string: Constant.dailyURL + "?q=\(city)&APPID=\(Constant.apiKey)&units=imperial")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { fatalError() }
            if let forecast = try? JSONDecoder().decode(Forecast.self, from: data) {
                completion(forecast)
            }
        }.resume()
    }
}
