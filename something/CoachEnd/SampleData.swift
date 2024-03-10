//
//  SampleData.swift
//  something
//
//  Created by Charles Blue on 2024/3/10.
//

import Foundation
import SwiftUI

struct TaskItem: Identifiable {
    var id = UUID()
    var icon: String
    var bgColor: Color
    var category: String
    var title: String
    var time: String
    var instructors: [String]
    var numOfGuests: Int
}

let lessons: [TaskItem] = [
    TaskItem(icon: "⛷️", bgColor: Color(red: 247/255, green: 212/255, blue: 72/255), category: "Adult Ski Lessons", title: "Club Beginner", time: "9:00 - 11:00 AM", instructors: ["Sammy", "David", "Kaleb"], numOfGuests: 60),
    TaskItem(icon: "⛷️", bgColor: Color(red: 151/255, green: 247/255, blue: 136/255), category: "Adult Ski Lessons", title: "Club 1", time: "9:00 - 11:00 AM", instructors: ["Ben", "Elena", "Charlie"], numOfGuests: 15),
    TaskItem(icon: "⛷️", bgColor: Color(red: 213/255, green: 215/255, blue: 252/255), category: "Adult Ski Lessons", title: "Club 2", time: "1:00 - 3:00 PM", instructors: ["Kaleb"], numOfGuests: 9),
    TaskItem(icon: "🏂", bgColor: Color(red: 141/255, green: 191/255, blue: 249/255), category: "Adult Snowboard Lessons", title: "SB Beginner", time: "9:00 - 11:00 AM", instructors: ["Sammy", "David", "Kaleb"], numOfGuests: 25),
]

let duties: [TaskItem] = [
    TaskItem(icon: "🪄", bgColor: Color(red: 155/255, green: 233/255, blue: 100/255), category: "AM", title: "Set Up Magic Carpet", time: "8:30 - 9:00", instructors: ["Sammy", "David", "Kaleb"], numOfGuests: -1),
    TaskItem(icon: "🐼", bgColor: Color(red: 236/255, green: 226/255, blue: 106/255), category: "AM", title: "Set Up Panda Garden", time: "8:30 - 9:00", instructors: ["Ben", "Elena", "Charlie"], numOfGuests: -1),
    TaskItem(icon: "✨", bgColor: Color.blue, category: "PM", title: "Pack Down Magic Carpet", time: "1:00 - 3:00 PM", instructors: ["Ben", "Elena", "Benjiamin"], numOfGuests: -1),
    TaskItem(icon: "📱", bgColor:  Color(red: 141/255, green: 191/255, blue: 106/255), category: "PM", title: "Phone Check", time: "20:00 - 20:30 AM", instructors: ["Sammy"], numOfGuests: -1),
]

let service: [TaskItem] = [
    TaskItem(icon: "🏪", bgColor: Color(red: 252/255, green: 241/255, blue: 113/255), category: "Ski Pro Shop", title: "Pro Shop Help", time: "16:00 - 17:00", instructors: ["David", "Kaleb", "Sammy"], numOfGuests: -1),
    TaskItem(icon: "🏪", bgColor: Color(red: 252/255, green: 241/255, blue: 113/255), category: "Ski Pro Shop", title: "Pro Shop Help", time: "17:00 - 18:00 AM", instructors: ["Ben", "Elena", "Charlie"], numOfGuests: -1),
    TaskItem(icon: "🤵‍♂️", bgColor: Color(red: 241/255, green: 159/255, blue: 150/255), category: "Reception", title: "TOM09 Arrival Help", time: "20:00 - 20:45 PM", instructors: ["Kaleb"], numOfGuests: -1),
    TaskItem(icon: "🤵‍♂️", bgColor: Color(red: 241/255, green: 159/255, blue: 150/255), category: "Reception", title: "TOM11 Arrival Help", time: "20:00 - 20:30 AM", instructors: ["Sammy", "David", "Kaleb"], numOfGuests: -1),
]
