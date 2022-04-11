//
//  Constant.swift
//  weather-forecast
//
//  Created by Kenz on 11/04/2022.
//

import Foundation
import SwiftUI

struct Constant {
    static let apiKey = "60c6fbeb4b93ac653c492ba806fc346d"
    static let baseURL = "https://api.openweathermap.org"
    static let dailyURL = baseURL + "/data/2.5/forecast/daily"
    static let imageURL = baseURL + "/img/w/"
    
    static let padding: CGFloat = 12
    static let width: CGFloat = 32
}
