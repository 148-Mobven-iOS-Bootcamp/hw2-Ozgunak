//
//  WeatherModel.swift
//  Homework 2
//
//  Created by ozgun on 24.12.2021.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    var name: String
    var temp: Double
    
    var tempString: String {
        return String(format: "%.1f", temp)
    }
    //MARK: - Closure is used to get condition name as string instead of seperate function.
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...332:
            return "cloud.drizzle"
        case 500...532:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...790:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...810:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
