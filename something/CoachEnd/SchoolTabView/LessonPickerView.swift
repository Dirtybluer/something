//
//  LessonPickerView.swift
//  something
//
//  Created by Charles Blue on 2024/3/3.
//

import SwiftUI

struct LessonPickerView: View{
    // Lesson data model
    struct Lesson: Identifiable {
        var id = UUID()
        var category: String
        var level: String
        var time: String
        var coach: String
        var guests: Int
    }
    
    // Sample lesson data
    let lessons: [Lesson] = [
        Lesson(category: "Adult Ski Lessons", level: "Club Beginner", time: "9:00 - 11:00 AM", coach: "Sammy", guests: 60),
        Lesson(category: "Adult Ski Lessons", level: "Club 1", time: "9:00 - 11:00 AM", coach: "Ben", guests: 15),
        Lesson(category: "Adult Ski Lessons", level: "Club 2", time: "1:00 - 3:00 PM", coach: "David", guests: 60),
        Lesson(category: "Adult Snowboard Lessons", level: "SB Beginner", time: "9:00 - 11:00 AM", coach: "Kaleb", guests: 9),
    ]

    // Group lessons by category
    var categorizedLessons: [String: [Lesson]] {
        Dictionary(grouping: lessons, by: { $0.category })
    }

    var body: some View {
        List {
            // Use a ForEach to iterate over categories
            ForEach(categorizedLessons.keys.sorted(), id: \.self) { category in
                Section(header: Text(category).foregroundColor(.primary).font(.subheadline).fontWeight(.bold)) {
                    // Layer another ForEach to iterate over lessons in this category
                    ForEach(categorizedLessons[category]!, id: \.id) { lesson in
                        HStack {
                            Image(systemName: "snow").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .background(Circle().fill(Color.blue.opacity(0.2)))
                            .clipShape(Circle())

                            VStack(alignment: .leading, spacing: 2) {
                                HStack{
                                    Text(lesson.level)
                                        .font(.headline)
                                    Spacer()
                                    Text("\(lesson.guests) Guests")
                                        .font(.subheadline)
                                }
                                Text(lesson.time)
                                    .font(.subheadline)
                                Text("Coach: \(lesson.coach)")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .listRowBackground(Color.gray.opacity(0.2))
            }
        }
    }
}

struct LessonPickerView_Previews: PreviewProvider {
    static var previews: some View {
        LessonPickerView()
    }
}
