//
//  ScheduleTabViewModel.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//

import Foundation
import CoreData

class ScheduleTabViewModel: ObservableObject {
    @Published var selectedDate: Date = generateDateFromString(dateString: "09-Jan-24")!
    @Published var showedScheduleItems: [ScheduleItem] = []
    @Published var viewingIntructorSkiName: String
    
    init(viewingIntructorSkiName: String) {
        self.viewingIntructorSkiName = viewingIntructorSkiName
    }
    
    func pullShowedScheduleItems() {
        var pulledScheduleItems: [ScheduleItem] = []
        for item in exampleSchduleItems {
            if (item.date == selectedDate && item.instructors.contains(viewingIntructorSkiName)) {
                pulledScheduleItems.append(item)
            }
        }
        self.showedScheduleItems = pulledScheduleItems
    }
    
    func updateDate(by days: Int) {
        if let newDate = Calendar.current.date(byAdding: .day, value: days, to: self.selectedDate) {
            self.selectedDate = newDate
        }
        self.pullShowedScheduleItems()
    }
    
    func setViewingInstructorName(name: String) {
        self.viewingIntructorSkiName = name
    }
    
}
