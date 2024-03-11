//
//  ProfileTimeSheetView.swift
//  something
//
//  Created by 张萌琦 on 2024/3/11.
//

import SwiftUI

struct ProfileTimeSheetView: View {
    let viewingInstructorName: String
    
    @Binding var today: Date
    
    @State private var selectedRange: String = "Week"
    let ranges = ["Week", "Month", "Season"]
    
    var dateRange: String {
        var startDate: Date
        var endDate: Date
        (startDate, endDate) = getDateRange(today: today, range: selectedRange) ?? (Date(), Date())
        
        return generateStringFromDate(date: startDate, format: "dd/MMM/yyyy")! + " - " + generateStringFromDate(date: endDate, format: "dd/MMM/yyyy")!
    }
    
    var statistics: [String: String] {
        var startDate: Date
        var endDate: Date
        (startDate, endDate) = getDateRange(today: today, range: selectedRange) ?? (Date(), Date())
        return ScheduleItem.statisticByInstructor(instructorName: viewingInstructorName, startDate: startDate, endDate: endDate)
    }
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedRange) {
                ForEach(ranges, id: \.self) { range in
                    Text(range).tag(range)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            
            Divider()
            
            HStack {
//                Button(action: {
//                    var dateComponent = DateComponents()
//                    switch selectedRange {
//                    case "Week":
//                        dateComponent.weekOfYear = -1
//                    case "Month":
//                        dateComponent.month = -1
//                    case "Season":
//                        dateComponent.month = -3
//                    default:
//                        break
//                    }
//                    if let newDate = Calendar.current.date(byAdding: dateComponent, to: today) {
//                        today = newDate
//                        print("Today is now \(today) \(newDate)")
//                    } else {
//                        print("Failed to calculate new date")
//                    }
//                }) {
//                    Image(systemName: "chevron.left")
//                }
                Spacer()
                
                Text(dateRange)
                    .foregroundColor(.gray)
                Spacer()
//                Button(action: {
//                    var dateComponent = DateComponents()
//                    switch selectedRange {
//                    case "Week":
//                        dateComponent.weekOfYear = 1
//                    case "Month":
//                        dateComponent.month = 1
//                    case "Season":
//                        dateComponent.month = 3
//                    default:
//                        break
//                    }
//                    today = Calendar.current.date(byAdding: dateComponent, to: today)!
//                    print("Today is now \(today)")
//                }) {
//                    Image(systemName: "chevron.right")
//                }
            }
            
            Spacer()
            
            VStack {
                HStack {
                    Spacer()
                    SingleStatisticView(number: statistics["Lesson"]!, unit: "Hrs", type: "Lesson")
                    Spacer()
                    SingleStatisticView(number: statistics["Duty"]!, unit: "Hrs", type: "Duty")
                    Spacer()
                    SingleStatisticView(number: statistics["Service"]!, unit: "Hrs", type: "Service")
                    Spacer()
                    SingleStatisticView(number: "5", unit: "Days", type: "Off")
                    Spacer()
                }
                
            }
        }
        
    }
}

struct SingleStatisticView: View {
    let number: String
    let unit: String
    let type: String
    
    var body: some View {
        VStack {
            HStack {
                Text(number)
                    .bold()
                    .font(.system(size: 25))
                Text(unit)
            }
            Text(type)
                .foregroundColor(.gray)
                .font(.system(size: 15))
        }
    }
}

//preview
struct ProfileTimeSheetView_Previews: PreviewProvider {
    @State static var today = Date()
    
    static var previews: some View {
        ProfileTimeSheetView(viewingInstructorName: "John", today: $today)
    }
}
