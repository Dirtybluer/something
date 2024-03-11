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
    // startTime and endTime are now stored as strings, using 24 hours format
    // (24 hours format allows them to be automatic sorted even if they are stored in strings)
    var startTime: String
    var endTime: String
    // added a compute property to return the time in a string format, 
    // it has the same name as before, so code in SchoolTabView will not be affected
    var time: String {
        return startTime + " - " + endTime
    }
    var instructors: [String]
    var numOfGuests: Int
    var meetingPoint: String?
    var date: Date
}

let lessons: [TaskItem] = [
    TaskItem(icon: "⛷️", bgColor: Color(red: 247/255, green: 212/255, blue: 72/255), category: "Adult Ski Lessons", title: "Club Beginner", startTime: "9:00", endTime: "11:00", instructors: ["Sammy", "Dave", "Kaleb"], numOfGuests: 56, meetingPoint: "Adult Departure", date: generateDateFromString(dateString: "09-Jan-24")!),
    TaskItem(icon: "⛷️", bgColor: Color(red: 151/255, green: 247/255, blue: 136/255), category: "Adult Ski Lessons", title: "Club 1", startTime: "9:00", endTime: "11:00", instructors: ["Ben", "Elena", "Charlie"], numOfGuests: 13, meetingPoint: "Adult Departure", date: generateDateFromString(dateString: "09-Jan-24")!),
    TaskItem(icon: "⛷️", bgColor: Color(red: 213/255, green: 215/255, blue: 252/255), category: "Adult Ski Lessons", title: "Club 2", startTime: "13:00", endTime: "15:00", instructors: ["Kaleb"], numOfGuests: 9, meetingPoint: "Adult Departure", date: generateDateFromString(dateString: "09-Jan-24")!),
    TaskItem(icon: "🏂", bgColor: Color(red: 141/255, green: 191/255, blue: 249/255), category: "Adult Snowboard Lessons", title: "SB Beginner", startTime: "9:00", endTime: "11:00", instructors: ["Dave", "Kaleb"], numOfGuests: 29, meetingPoint: "Adult Departure", date: generateDateFromString(dateString: "09-Jan-24")!),
    
    TaskItem(icon: "⛷️", bgColor: Color(red: 247/255, green: 212/255, blue: 72/255), category: "Adult Ski Lessons", title: "Club Beginner", startTime: "9:00", endTime: "11:00", instructors: ["Sammy", "Elena", "Charlie"], numOfGuests: 67, meetingPoint: "Adult Departure", date: generateDateFromString(dateString: "10-Jan-24")!),
    TaskItem(icon: "⛷️", bgColor: Color(red: 151/255, green: 247/255, blue: 136/255), category: "Adult Ski Lessons", title: "Club 1", startTime: "9:00", endTime: "11:00", instructors: ["Ben", "Dave", "Kaleb"], numOfGuests: 17, meetingPoint: "Adult Departure", date: generateDateFromString(dateString: "10-Jan-24")!),
    TaskItem(icon: "⛷️", bgColor: Color(red: 213/255, green: 215/255, blue: 252/255), category: "Adult Ski Lessons", title: "Club 2", startTime: "13:00", endTime: "15:00", instructors: ["Charlie"], numOfGuests: 9, meetingPoint: "Adult Departure", date: generateDateFromString(dateString: "10-Jan-24")!),
    TaskItem(icon: "🏂", bgColor: Color(red: 141/255, green: 191/255, blue: 249/255), category: "Adult Snowboard Lessons", title: "SB Beginner", startTime: "9:00", endTime: "11:00", instructors: ["Elena", "Charlie"], numOfGuests: 23, meetingPoint: "Adult Departure", date: generateDateFromString(dateString: "10-Jan-24")!),
    
    TaskItem(icon: "⛷️", bgColor: Color(red: 247/255, green: 212/255, blue: 72/255), category: "Adult Ski Lessons", title: "Club Beginner", startTime: "9:00", endTime: "11:00", instructors: ["Ben", "Dave", "Charlie"], numOfGuests: 60, meetingPoint: "Adult Departure", date: generateDateFromString(dateString: "11-Jan-24")!),
    TaskItem(icon: "⛷️", bgColor: Color(red: 151/255, green: 247/255, blue: 136/255), category: "Adult Ski Lessons", title: "Club 1", startTime: "9:00", endTime: "11:00", instructors: ["Sammy", "Elena", "Kaleb"], numOfGuests: 15, meetingPoint: "Adult Departure", date: generateDateFromString(dateString: "11-Jan-24")!),
    TaskItem(icon: "⛷️", bgColor: Color(red: 213/255, green: 215/255, blue: 252/255), category: "Adult Ski Lessons", title: "Club 2", startTime: "13:00", endTime: "15:00", instructors: ["Charlie"], numOfGuests: 9, meetingPoint: "Adult Departure", date: generateDateFromString(dateString: "11-Jan-24")!),
    TaskItem(icon: "🏂", bgColor: Color(red: 141/255, green: 191/255, blue: 249/255), category: "Adult Snowboard Lessons", title: "SB Beginner", startTime: "9:00", endTime: "11:00", instructors: ["Dave", "Charlie"], numOfGuests: 25, meetingPoint: "Adult Departure", date: generateDateFromString(dateString: "11-Jan-24")!),

]   

let duties: [TaskItem] = [
    TaskItem(icon: "🪄", bgColor: Color(red: 155/255, green: 233/255, blue: 100/255), category: "AM", title: "Setup Magic Carpet", startTime: "8:00", endTime: "9:00", instructors: ["Sammy", "Dave", "Kaleb"], numOfGuests: -1, date: generateDateFromString(dateString: "09-Jan-24")!),
    TaskItem(icon: "🐼", bgColor: Color(red: 236/255, green: 226/255, blue: 106/255), category: "AM", title: "Setup Panda Garden", startTime: "8:30", endTime: "9:00", instructors: ["Ben", "Dave", "Kaleb"], numOfGuests: -1, date: generateDateFromString(dateString: "09-Jan-24")!),
    TaskItem(icon: "✨", bgColor: Color.blue, category: "PM", title: "Pack Down Magic Carpet", startTime: "13:00", endTime: "15:00", instructors: ["Ben", "Elena", "Benjiamin"], numOfGuests: -1, date: generateDateFromString(dateString: "09-Jan-24")!),
    TaskItem(icon: "📱", bgColor:  Color(red: 141/255, green: 191/255, blue: 106/255), category: "PM", title: "Phone Check", startTime: "20:00", endTime: "20:30", instructors: ["Sammy"], numOfGuests: -1, date: generateDateFromString(dateString: "09-Jan-24")!),
    
    TaskItem(icon: "🪄", bgColor: Color(red: 155/255, green: 233/255, blue: 100/255), category: "AM", title: "Setup Magic Carpet", startTime: "8:00", endTime: "9:00", instructors: ["Sammy", "Elena", "Charlie"], numOfGuests: -1, date: generateDateFromString(dateString: "10-Jan-24")!),
    TaskItem(icon: "🐼", bgColor: Color(red: 236/255, green: 226/255, blue: 106/255), category: "AM", title: "Setup Panda Garden", startTime: "8:30", endTime: "9:00", instructors: ["Ben", "Dave", "Kaleb"], numOfGuests: -1, date: generateDateFromString(dateString: "10-Jan-24")!),
    TaskItem(icon: "✨", bgColor: Color.blue, category: "PM", title: "Pack Down Magic Carpet", startTime: "13:00", endTime: "15:00", instructors: ["Ben", "Elena", "Benjiamin"], numOfGuests: -1, date: generateDateFromString(dateString: "10-Jan-24")!),
    TaskItem(icon: "📱", bgColor:  Color(red: 141/255, green: 191/255, blue: 106/255), category: "PM", title: "Phone Check", startTime: "20:00", endTime: "20:30", instructors: ["Sammy"], numOfGuests: -1, date: generateDateFromString(dateString: "10-Jan-24")!),
    
    TaskItem(icon: "🪄", bgColor: Color(red: 155/255, green: 233/255, blue: 100/255), category: "AM", title: "Setup Magic Carpet", startTime: "8:00", endTime: "9:00", instructors: ["Ben", "Dave", "Charlie"], numOfGuests: -1, date: generateDateFromString(dateString: "11-Jan-24")!),
    TaskItem(icon: "🐼", bgColor: Color(red: 236/255, green: 226/255, blue: 106/255), category: "AM", title: "Setup Panda Garden", startTime: "8:30", endTime: "9:00", instructors: ["Sammy", "Elena", "Kaleb"], numOfGuests: -1, date: generateDateFromString(dateString: "11-Jan-24")!),
    TaskItem(icon: "✨", bgColor: Color.blue, category: "PM", title: "Pack Down Magic Carpet", startTime: "13:00", endTime: "15:00", instructors: ["Ben", "Elena", "Benjiamin"], numOfGuests: -1, date: generateDateFromString(dateString: "11-Jan-24")!),
    TaskItem(icon: "📱", bgColor:  Color(red: 141/255, green: 191/255, blue: 106/255), category: "PM", title: "Phone Check", startTime: "20:00", endTime: "20:30", instructors: ["Ben"], numOfGuests: -1, date: generateDateFromString(dateString: "11-Jan-24")!),
]

let service: [TaskItem] = [
    TaskItem(icon: "🏪", bgColor: Color(red: 252/255, green: 241/255, blue: 113/255), category: "Ski Pro Shop", title: "Pro Shop Help", startTime: "16:00", endTime: "17:00", instructors: ["Dave", "Kaleb", "Sammy"], numOfGuests: -1, date: generateDateFromString(dateString: "09-Jan-24")!),
    TaskItem(icon: "🏪", bgColor: Color(red: 252/255, green: 241/255, blue: 113/255), category: "Ski Pro Shop", title: "Pro Shop Help", startTime: "17:00", endTime: "18:00", instructors: ["Ben", "Elena", "Charlie"], numOfGuests: -1, date: generateDateFromString(dateString: "09-Jan-24")!),
    TaskItem(icon: "🤵‍♂️", bgColor: Color(red: 241/255, green: 159/255, blue: 150/255), category: "Reception", title: "TOM09 Arrival Help", startTime: "20:00", endTime: "20:45", instructors: ["Kaleb"], numOfGuests: -1, date: generateDateFromString(dateString: "09-Jan-24")!),
    TaskItem(icon: "🤵‍♂️", bgColor: Color(red: 241/255, green: 159/255, blue: 150/255), category: "Reception", title: "TOM11 Arrival Help", startTime: "20:00", endTime: "20:30", instructors: ["Sammy", "Dave", "Kaleb"], numOfGuests: -1, date: generateDateFromString(dateString: "09-Jan-24")!),
    
    TaskItem(icon: "🏪", bgColor: Color(red: 252/255, green: 241/255, blue: 113/255), category: "Ski Pro Shop", title: "Pro Shop Help", startTime: "16:00", endTime: "17:00", instructors: ["Sammy", "Elena", "Charlie"], numOfGuests: -1, date: generateDateFromString(dateString: "10-Jan-24")!),
    TaskItem(icon: "🏪", bgColor: Color(red: 252/255, green: 241/255, blue: 113/255), category: "Ski Pro Shop", title: "Pro Shop Help", startTime: "17:00", endTime: "18:00", instructors: ["Ben", "Dave", "Kaleb"], numOfGuests: -1, date: generateDateFromString(dateString: "10-Jan-24")!),
    TaskItem(icon: "🤵‍♂️", bgColor: Color(red: 241/255, green: 159/255, blue: 150/255), category: "Reception", title: "TOM09 Arrival Help", startTime: "20:00", endTime: "20:45", instructors: ["Charlie"], numOfGuests: -1, date: generateDateFromString(dateString: "10-Jan-24")!),
    TaskItem(icon: "🤵‍♂️", bgColor: Color(red: 241/255, green: 159/255, blue: 150/255), category: "Reception", title: "TOM11 Arrival Help", startTime: "20:00", endTime: "20:30", instructors: ["Sammy", "Elena", "Charlie"], numOfGuests: -1, date: generateDateFromString(dateString: "10-Jan-24")!),
    
    TaskItem(icon: "🏪", bgColor: Color(red: 252/255, green: 241/255, blue: 113/255), category: "Ski Pro Shop", title: "Pro Shop Help", startTime: "16:00", endTime: "17:00", instructors: ["Elena", "Kaleb", "Ben"], numOfGuests: -1, date: generateDateFromString(dateString: "11-Jan-24")!),
    TaskItem(icon: "🏪", bgColor: Color(red: 252/255, green: 241/255, blue: 113/255), category: "Ski Pro Shop", title: "Pro Shop Help", startTime: "17:00", endTime: "18:00", instructors: ["Sammy", "Dave", "Charlie"], numOfGuests: -1, date: generateDateFromString(dateString: "11-Jan-24")!),
    TaskItem(icon: "🤵‍♂️", bgColor: Color(red: 241/255, green: 159/255, blue: 150/255), category: "Reception", title: "TOM09 Arrival Help", startTime: "20:00", endTime: "20:45", instructors: ["Kaleb"], numOfGuests: -1, date: generateDateFromString(dateString: "11-Jan-24")!),
    TaskItem(icon: "🤵‍♂️", bgColor: Color(red: 241/255, green: 159/255, blue: 150/255), category: "Reception", title: "TOM11 Arrival Help", startTime: "20:00", endTime: "20:30", instructors: ["Ben", "Elena", "Kaleb"], numOfGuests: -1, date: generateDateFromString(dateString: "11-Jan-24")!),
]

struct ScheduleItem: Identifiable {
    var scheduleName: String
    var scheduleDescribe: String
    var meetingPoint: String?
    var date: Date
    var startTime: String
    var endTime: String
    var signUpNum: Int
    var instructors: [String]
    var id = UUID()
    var color: Color
    var icon: String
    var type: String
    
    init(scheduleName: String, scheduleDescribe: String, meetingPoint: String? = nil, date: Date, startTime: String, endTime: String, signUpNum: Int, instructors: [String], id: UUID = UUID(), color: Color, icon: String, type: String) {
        self.scheduleName = scheduleName
        self.scheduleDescribe = scheduleDescribe
        self.meetingPoint = meetingPoint
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
        self.signUpNum = signUpNum
        self.instructors = instructors
        self.id = id
        self.color = color
        self.icon = icon
        var capitalizedInstructors: [String] = []
        for instructor in self.instructors{
            capitalizedInstructors.append(instructor.capitalized)
        }
        self.instructors = capitalizedInstructors
        self.type = type
    }
    
    static func statisticByInstructor(instructorName: String, startDate: Date, endDate: Date) -> [String: String] {
        var lessonHour: Float = 0
        var dutyHour: Float = 0
        var serviceHour: Float = 0
        var dayOffNum: Int = 0

        var mostFrequentLessonTitle: String = ""
        var mostFrequentLessonCategory: String = ""

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        // Loop through all the schedule items
        for item in exampleSchduleItems {
            // Check if the item's date is within the given date range and the instructor is the given instructor
            if item.date >= startDate && item.date <= endDate && item.instructors.contains(instructorName) {
                // Calculate the duration of the item
                let startTime = dateFormatter.date(from: item.startTime)!
                let endTime = dateFormatter.date(from: item.endTime)!
                let duration = Float(endTime.timeIntervalSince(startTime)) / 3600

                // Update the statistics based on the item's type
                switch item.type {
                case "Lesson":
                    lessonHour += duration
                    mostFrequentLessonTitle = item.scheduleName
                    mostFrequentLessonCategory = item.scheduleDescribe
                case "Duty":
                    dutyHour += duration
                case "Service":
                    serviceHour += duration
                default:
                    break
                }
            }
        }

        // Calculate the number of days off
        dayOffNum = Int((endDate.timeIntervalSince(startDate) / (24 * 3600))) - Int(lessonHour + dutyHour + serviceHour)

        // Return the statistics, should all be formatted as strings
        return [
            "Lesson": String(format: "%.1f", lessonHour),
            "Duty": String(format: "%.1f", dutyHour),
            "Service": String(format: "%.1f", serviceHour),
            "DayOff": String(dayOffNum),
            "FreqLessonTitle": mostFrequentLessonTitle,
            "FreqLessonCategory": mostFrequentLessonCategory
        ]
    }
}

struct Instructor: Identifiable {
    var id = UUID()
    var name: String
    var skiName: String
    var color: Color
    var icon: String
    var residence: String
    var skiLevel: String
    var sbLevel: String
    var skill: String
    
    init(id: UUID = UUID(), name: String, skiName: String, color: Color, icon: String, residence: String, skiLevel: String, sbLevel: String, skill: String) {
        self.id = id
        self.name = name
        self.skiName = skiName.capitalized
        self.color = color
        self.icon = icon
        self.residence = residence
        self.skiLevel = skiLevel
        self.sbLevel = sbLevel
        self.skill = skill
    }
    
    static func getInstructor(skiName: String) -> Instructor? {
        for instructor in exampleInstructors {
            if instructor.skiName == skiName.capitalized {
                return instructor
            }
        }
        return nil
    }
}

let exampleInstructors: [Instructor] = [
    Instructor(name: "Charles Edward Hebburn- HEATH", skiName: "CHARLIE", color: .red, icon: "🐼", residence: "Ishikari", skiLevel: "Lv2", sbLevel: "", skill: "Ski"),
    Instructor(name: "Benjamin cedergren", skiName: "BENJAMIN", color: .green, icon: "🐨", residence: "Ishikari", skiLevel: "Lv1", sbLevel: "", skill: "Ski"),
    Instructor(name: "Kaleb Ginn", skiName: "KALEB", color: .blue, icon: "🐯", residence: "Dorm", skiLevel: "Lv1", sbLevel: "", skill: "Ski"),
    Instructor(name: "Sam Sheng", skiName: "SAMMY", color: .orange, icon: "🦁", residence: "Dorm", skiLevel: "Lv1", sbLevel: "Lv2", skill: "Dual"),
    Instructor(name: "Elena Egorov", skiName: "ELENA", color: .purple, icon: "🐵", residence: "Ishikari", skiLevel: "", sbLevel: "Lv2", skill: "SB"),
    Instructor(name: "David Fryer(EA)", skiName: "DAVE", color: .yellow, icon: "🐺", residence: "Dorm", skiLevel: "", sbLevel: "Lv1", skill: "SB"),
    Instructor(name: "Ben Coad(EA)", skiName: "BEN", color: .pink, icon: "🦊", residence: "Dorm", skiLevel: "", sbLevel: "Lv1", skill: "SB")
]

var exampleSchduleItems: [ScheduleItem] {
    var scheduletItemList: [ScheduleItem] = []
    
    for item in lessons {
        let newScheduleItem = ScheduleItem(scheduleName: item.title, scheduleDescribe: item.category, meetingPoint: item.meetingPoint, date: item.date, startTime: item.startTime, endTime: item.endTime, signUpNum: item.numOfGuests, instructors: item.instructors, color: item.bgColor, icon: item.icon, type: "Lesson")
        scheduletItemList.append(newScheduleItem)
    }
    
    for item in duties {
        let newScheduleItem = ScheduleItem(scheduleName: item.title, scheduleDescribe: item.category, meetingPoint: item.meetingPoint, date: item.date, startTime: item.startTime, endTime: item.endTime, signUpNum: item.numOfGuests, instructors: item.instructors, color: item.bgColor, icon: item.icon, type: "Duty")
        scheduletItemList.append(newScheduleItem)
    }
    
    for item in service {
        let newScheduleItem = ScheduleItem(scheduleName: item.title, scheduleDescribe: item.category, meetingPoint: item.meetingPoint, date: item.date, startTime: item.startTime, endTime: item.endTime, signUpNum: item.numOfGuests, instructors: item.instructors, color: item.bgColor, icon: item.icon, type: "Service")
        scheduletItemList.append(newScheduleItem)
    }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"

    let sortedScheduleItemList = scheduletItemList.sorted {
        guard let date1 = dateFormatter.date(from: $0.startTime),
            let date2 = dateFormatter.date(from: $1.startTime) else {
            return false
        }
        return date1 < date2
    }
        
    return sortedScheduleItemList
}

func getTasksByDate(_ tasks: [TaskItem], selectedDate date: Date) -> [TaskItem] {
    return tasks.filter { task in
        return task.date == date
    }
}


struct AssistantItem: Identifiable {
    var id = UUID()
    var name: String
    var department: String
    var bgColor: Color
}

let assistantOnDuty: [AssistantItem] = [
    AssistantItem(name: "Jason Ohh", department: "Adult Departure", bgColor: Color(red: 247/255, green: 212/255, blue: 72/255)),
    AssistantItem(name: "Thomas Platt", department: "Small Kids Departure", bgColor: Color(red: 241/255, green: 155/255, blue: 144/255)),
    AssistantItem(name: "Tets Dan", department: "Big Kids Departure", bgColor: Color(red: 164/255, green: 246/255, blue: 106/255)),
    AssistantItem(name: "Moe H", department: "Ski Office Administration", bgColor: Color(red: 242/255, green: 154/255, blue: 199/255)),
    ]


