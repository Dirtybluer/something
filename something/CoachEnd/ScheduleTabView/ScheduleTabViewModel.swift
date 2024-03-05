//
//  ScheduleTabViewModel.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//

import Foundation

class ScheduleTabViewModel: ObservableObject {
    @Published var selectedDate: Date = Date()
    @Published var showedScheduleItems: [ScheduleItemFake] = [
        ScheduleItemFake(timeRange: "9:00 - 11:00", name: "Small - AM", numberOfParticipants: 5, numberOfInstructors: 3, location: "Kids Room", imageName: "sun.min.fill"),
        ScheduleItemFake(timeRange: "13:00 - 15:00", name: "Bigger 3 - PM", numberOfParticipants: 3, numberOfInstructors: 3, location: "Big Kids Room", imageName: "snow"),
        ScheduleItemFake(timeRange: "16:00 - 17:00", name: "Tea Time", numberOfParticipants: 0, numberOfInstructors: 2, location: "Theatre", imageName: "cup.and.saucer.fill"),
        ScheduleItemFake(timeRange: "20:15 - 22:30", name: "Night Shift", numberOfParticipants: 0, numberOfInstructors: 7, location: "Theatre", imageName: "moon.fill"),
    ]
    
    func pullShowedScheduleItems() {
        
    }
    
    func updateDate(by days: Int) {
       if let newDate = Calendar.current.date(byAdding: .day, value: days, to: self.selectedDate) {
           self.selectedDate = newDate
        }
    }
    
}
