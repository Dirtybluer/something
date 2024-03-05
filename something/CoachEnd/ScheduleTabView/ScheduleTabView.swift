//
//  SchefuleTabView.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//

import Foundation
import SwiftUI

struct ScheduleTabView: View {
    
    @State private var selectedDate: Date = Date()
    var viewingInstructorName: String = "Sammy"

    private let schedule: [ScheduleItemFake] = [
        ScheduleItemFake(timeRange: "9:00 - 11:00", name: "Small - AM", numberOfParticipants: 5, numberOfInstructors: 3, location: "Kids Room", imageName: "sun.min.fill"),
        ScheduleItemFake(timeRange: "13:00 - 15:00", name: "Bigger 3 - PM", numberOfParticipants: 3, numberOfInstructors: 3, location: "Big Kids Room", imageName: "snow"),
        ScheduleItemFake(timeRange: "16:00 - 17:00", name: "Tea Time", numberOfParticipants: 0, numberOfInstructors: 2, location: "Theatre", imageName: "cup.and.saucer.fill"),
        ScheduleItemFake(timeRange: "20:15 - 22:30", name: "Night Shift", numberOfParticipants: 0, numberOfInstructors: 7, location: "Theatre", imageName: "moon.fill"),
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
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
                    
                    NavigationLink(destination: ScheduleCalendarView(date: selectedDate, schedule: exampleLessons)) {
                        Image(systemName: "calendar")
                            .font(.title3)
                    }
            
                }
                .padding(.horizontal, 16)
                
                List {
                    ForEach(exampleLessons) { item in
                        ZStack(alignment: .center) {
                            NavigationLink(destination: ScheduleItemDetailedView(viewingInstructorName: viewingInstructorName, scheduleItem: item)) {
                                EmptyView()
                            }
                            ScheduleRowView(item: item)
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle(viewingInstructorName)
            .background(Color(UIColor.tertiarySystemGroupedBackground))
        }
        
    }
    
    private func updateDate(by days: Int) {
        if let newDate = Calendar.current.date(byAdding: .day, value: days, to: selectedDate) {
            selectedDate = newDate
        }
    }
}


struct ScheduleTabView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleTabView()
    }
}
