//
//  Utils.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//

import Foundation
import SwiftUI

var backgroundGeryColor: Color { Color(red: 243/255, green: 242/255, blue: 248/255) }

func generateDateFromString(dateString: String, format: String = "dd-MMM-yy") -> Date? {
    var resultDate: Date? = nil
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    if let date = dateFormatter.date(from: dateString) {
        resultDate = date
    } else {
        print("The string cannot be converted to a date.")
    }
    return resultDate
}

func generateStringFromDate(date: Date?, format: String = "dd-MMM-yy") -> String? {
    if (date != nil) {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let dateString = formatter.string(from: date!)
        return dateString
    } else {
        return nil
    }
}

func getDateRange(today: Date, range: String) -> (Date, Date)? {
    let calendar = Calendar.current
    var startDate: Date?
    var endDate: Date?
    
    switch range {
    case "Week":
        startDate = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))
        endDate = calendar.date(byAdding: .day, value: 7, to: startDate!)
    case "Month":
        startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: today))
        endDate = calendar.date(byAdding: .month, value: 1, to: startDate!)
    case "Season":
        let quarter = calendar.component(.quarter, from: today)
        startDate = calendar.date(from: DateComponents(year: calendar.component(.year, from: today), quarter: quarter))
        endDate = calendar.date(byAdding: .month, value: 3, to: startDate!)
    default:
        print("Invalid range.")
        return nil
    }
    
//    return generateStringFromDate(date: startDate!, format: "dd/MMM/yyyy")! + " - " + generateStringFromDate(date: endDate!, format: "dd/MMM/yyyy")!
    return (startDate!, endDate!)
}
