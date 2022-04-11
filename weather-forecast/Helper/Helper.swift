//
//  Helper.swift
//  weather-forecast
//
//  Created by Kenz on 11/04/2022.
//
import Foundation

struct Helper {
    func timeConverter(timeStamp: Int, isDay: Bool) -> String {
        let unixTimeStamp = timeStamp
        let date = Date(timeIntervalSince1970: TimeInterval(unixTimeStamp))
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.locale = .current
        formatter.dateFormat = "EEE, dd MMM yyyy"
        return formatter.string(from: date)
    }
}
