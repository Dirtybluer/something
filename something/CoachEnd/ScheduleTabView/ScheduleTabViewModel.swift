//
//  ScheduleTabViewModel.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//

import Foundation
import CoreData

class ScheduleTabViewModel: ObservableObject {
    let context: NSManagedObjectContext
    @Published var selectedDate: Date = generateDateFromString(dateString: "09-Jan-24")!
//    @Published var selectedDate: Date = Date()
    @Published var showedScheduleItems: [ScheduleItem] = []
    @Published var viewingIntructorSkiName: String = "Amy"
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.pullShowedScheduleItems()
    }
    
    func pullShowedScheduleItems() {
        let request = NSFetchRequest<ScheduleItem>(entityName: "ScheduleItem")

        let startOfDay = Calendar.current.startOfDay(for: selectedDate)
        let endOfDay = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!

        request.predicate = NSPredicate(format: "(date >= %@) AND (date < %@) AND ANY instructors.skiName == %@", startOfDay as NSDate, endOfDay as NSDate, viewingIntructorSkiName.uppercased())
//        request.predicate = NSPredicate(format: "(date >= %@) AND (date < %@)", startOfDay as NSDate, endOfDay as NSDate)
//        request.predicate = NSPredicate(format: "ANY instructors.skiName == %@", viewingIntructorSkiName.uppercased())
        request.sortDescriptors = [NSSortDescriptor(key: "startTime", ascending: true)]

        do {
            print("Pulling ScheduleItem Objects")
            showedScheduleItems = try context.fetch(request)
            print("Number of Pulled ScheduleItem Objects: \(showedScheduleItems.count)")
        } catch {
            print("Failed to fetch ScheduleItem objects:", error.localizedDescription)
        }
    }
    
    func updateDate(by days: Int) {
        if let newDate = Calendar.current.date(byAdding: .day, value: days, to: self.selectedDate) {
            self.selectedDate = newDate
        }
        self.pullShowedScheduleItems()
    }
    
}
