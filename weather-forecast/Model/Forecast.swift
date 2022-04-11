//
//  Forecast.swift
//  weather-forecast
//
//  Created by Kenz on 11/04/2022.
//

import Foundation

struct Forecast: Decodable {
    var city: City
    var list: [Day]
    
    struct City: Decodable {
        var name: String?
        var country: String?
    }

    struct Day: Decodable {
        var dt: Int?
        var pressure: Int?
        var humidity: Int?
        var speed: Double?
        var temp: Temp?
        var weather: [Weather]?
        
        struct Temp: Decodable {
            var day: Double?
            var min: Double?
            var max: Double?
            var eve: Double?
        }
        
        struct Weather: Decodable {
            var main: String?
            var description: String?
            var icon: String?
        }
    }
}

extension Forecast.Day {
    var day: String {
        if let day = dt {
            let formattedDay = Helper().timeConverter(timeStamp: day, isDay: false)
            return formattedDay
        } else {
            return ""
        }
    }
    
    var dayString: String {
        "Date: " + day
    }
    
    var url: URL? {
        guard let name = weather?.first?.icon else { return nil }
        return URL(string:  Constant.imageURL + name + ".png")
    }
    
    var tempAveString: String {
        let eve = (temp?.eve ?? 0).removeZerosFromEnd()
        return "Average Temparature: \(eve)" + "\u{00B0}C"
    }
    
    var weatherDescription: String {
        "Description: \(weather?.first?.description ?? "")"
    }
    
    var humidityString: String {
        "Humaidity: \(humidity ?? 0)%"
    }
    
    var pressureString: String {
        "Pressure: \(pressure ?? 0)"
    }
}
