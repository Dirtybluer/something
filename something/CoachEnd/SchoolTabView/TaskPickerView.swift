//
//  LessonPickerView.swift
//  something
//
//  Created by Charles Blue on 2024/3/3.
//

import SwiftUI

struct TaskPickerView: View{
    var tasks: [TaskItem]
    
    // Sample lesson data
    let lessons: [TaskItem] = [
        TaskItem(icon: "snow", category: "Adult Ski Lessons", title: "Club Beginner", time: "9:00 - 11:00 AM", instructors: ["Sammy", "David", "Kaleb"], numOfGuests: 60),
        TaskItem(icon: "snow", category: "Adult Ski Lessons", title: "Club 1", time: "9:00 - 11:00 AM", instructors: ["Ben", "Elena", "Charlie"], numOfGuests: 15),
        TaskItem(icon: "snow", category: "Adult Ski Lessons", title: "Club 2", time: "1:00 - 3:00 PM", instructors: ["Kaleb"], numOfGuests: 9),
        TaskItem(icon: "snow", category: "Adult Snowboard Lessons", title: "SB Beginner", time: "9:00 - 11:00 AM", instructors: ["Sammy", "David", "Kaleb"], numOfGuests: 25),
    ]

    // Group lessons by category
    var categorizedLessons: [String: [TaskItem]] {
        Dictionary(grouping: tasks, by: { $0.category })
    }

    var body: some View {
        List {
            // Use a ForEach to iterate over categories
            ForEach(categorizedLessons.keys.sorted(), id: \.self) { category in
                Section(header: Text(category).foregroundColor(.primary).font(.subheadline).fontWeight(.bold)) {
                    // Layer another ForEach to iterate over lessons in this category
                    ForEach(categorizedLessons[category]!, id: \.id) { lesson in
                        TaskRowView(item: lesson)
                    }
                }
                .listRowBackground(Color.gray.opacity(0.2))
            }
        }
    }
}

struct TaskPickerView_Previews: PreviewProvider {
    static var previews: some View {
        TaskPickerView(tasks: duties)
    }
}

let lessons: [TaskItem] = [
    TaskItem(icon: "snow", category: "Adult Ski Lessons", title: "Club Beginner", time: "9:00 - 11:00 AM", instructors: ["Sammy", "David", "Kaleb"], numOfGuests: 60),
    TaskItem(icon: "snow", category: "Adult Ski Lessons", title: "Club 1", time: "9:00 - 11:00 AM", instructors: ["Ben", "Elena", "Charlie"], numOfGuests: 15),
    TaskItem(icon: "snow", category: "Adult Ski Lessons", title: "Club 2", time: "1:00 - 3:00 PM", instructors: ["Kaleb"], numOfGuests: 9),
    TaskItem(icon: "snow", category: "Adult Snowboard Lessons", title: "SB Beginner", time: "9:00 - 11:00 AM", instructors: ["Sammy", "David", "Kaleb"], numOfGuests: 25),
]

let duties: [TaskItem] = [
    TaskItem(icon: "music.note", category: "AM", title: "Set Up Magic Carpet", time: "8:30 - 9:00", instructors: ["Sammy", "David", "Kaleb"], numOfGuests: -1),
    TaskItem(icon: "music.note", category: "AM", title: "Set Up Panda Garden", time: "8:30 - 9:00", instructors: ["Ben", "Elena", "Charlie"], numOfGuests: -1),
    TaskItem(icon: "music.note", category: "PM", title: "Pack Down Magic Carpet", time: "1:00 - 3:00 PM", instructors: ["Ben", "Elena", "Benjiamin"], numOfGuests: -1),
    TaskItem(icon: "music.note", category: "PM", title: "Phone Check", time: "20:00 - 20:30 AM", instructors: ["Sammy"], numOfGuests: -1),
]

let service: [TaskItem] = [
    TaskItem(icon: "person.fill", category: "Ski Pro Shop", title: "Pro Shop Help", time: "16:00 - 17:00", instructors: ["David", "Kaleb", "Sammy"], numOfGuests: -1),
    TaskItem(icon: "person.fill", category: "Ski Pro Shop", title: "Club 1", time: "9:00 - 11:00 AM", instructors: ["Ben", "Elena", "Charlie"], numOfGuests: -1),
    TaskItem(icon: "person.fill", category: "Reception", title: "TOM09 Arrival Help", time: "1:00 - 3:00 PM", instructors: ["Kaleb"], numOfGuests: -1),
    TaskItem(icon: "person.fill", category: "Reception", title: "TOM11 Arrival Help", time: "20:00 - 20:30 AM", instructors: ["Sammy", "David", "Kaleb"], numOfGuests: -1),
]
