//
//  SchoolTabView.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//

import Foundation
import SwiftUI


struct SchoolTabView: View  {
    @State private var selectedDate: Date = Date()

    @State private var selectedCategory: String = "Lessons"
    let categories = ["Lessons", "Duty", "Services", "Others"]

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
        VStack(spacing: 20) {
            HStack {
                Text("Tomamu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 16)
                Spacer()
            }

            HStack {
                Button(action: { updateDate(by: -1) }) {
                    Image(systemName: "chevron.left")
                }
                Text(dateFormatter.string(from: selectedDate))
                    .font(.title3)
                    .fontWeight(.bold)
                Button(action: { updateDate(by: 1) }) {
                    Image(systemName: "chevron.right")
                }
                
                Spacer()
                
                Button(action: {
                    // todo: 跳转查看日历
                }) {
                    Image(systemName: "calendar")
                        .font(.title3)
                }
            }
            .padding(.horizontal, 16)

            Picker("Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category).tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            if selectedCategory == "Lessons" {
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
                                    .background(Circle().fill(Color.gray.opacity(0.2)))
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
                    }
                }
            } else {
                Text("todo")
            }
        }
    }
        
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }
    
    private func updateDate(by days: Int) {
        if let newDate = Calendar.current.date(byAdding: .day, value: days, to: selectedDate) {
            selectedDate = newDate
        }
    }
}


struct SchoolTabView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolTabView()
    }
}
