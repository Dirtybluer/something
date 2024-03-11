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
        formatter.dateFormat = "dd-MM-yy"
        let dateString = formatter.string(from: date!)
        return dateString
    } else {
        return nil
    }
}


