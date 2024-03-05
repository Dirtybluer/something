//
//  ScheduleCalendarView.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//

import Foundation
import SwiftUI

struct ScheduleCalendarView: View {
    @State var date: Date
    @State var schedule: [LessonItem]
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle (cornerRadius: 15)
                    .foregroundColor(Color.white)
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .padding(.horizontal)
            }
            .padding()
    
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(schedule) { item in
                        ScheduleRowView(item: item)
                            .padding(.top)
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(dateFormatter.string(from: date))
        .navigationBarTitleDisplayMode(.inline)
        .background(backgroundGeryColor)
    }
}

















struct ScheduleCalendarView_Previews: PreviewProvider {
    static var schedule: [ScheduleItemFake] = [
        ScheduleItemFake(timeRange: "9:00 - 11:00", name: "Small - AM", numberOfParticipants: 5, numberOfInstructors: 3, location: "Kids Room", imageName: "sun.min.fill"),
        ScheduleItemFake(timeRange: "13:00 - 15:00", name: "Bigger 3 - PM", numberOfParticipants: 3, numberOfInstructors: 3, location: "Big Kids Room", imageName: "snow"),
        ScheduleItemFake(timeRange: "16:00 - 17:00", name: "Tea Time", numberOfParticipants: 0, numberOfInstructors: 2, location: "Theatre", imageName: "cup.and.saucer.fill"),
        ScheduleItemFake(timeRange: "20:15 - 22:30", name: "Night Shift", numberOfParticipants: 0, numberOfInstructors: 7, location: "Theatre", imageName: "moon.fill"),
    ]
    static var previews: some View {
        ScheduleCalendarView(date: Date(), schedule: exampleLessons)
    }
}
