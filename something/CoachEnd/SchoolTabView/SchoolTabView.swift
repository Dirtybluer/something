//
//  SchoolTabView.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//
import SwiftUI


struct SchoolTabView: View  {
    private var resortName = "Tomamu"

    @State private var selectedDate: Date = generateDateFromString(dateString: "09-Jan-24")!

    @State private var isDatePickerPresented = false

    
    @State private var selectedCategory: String = "Lessons"
    let categories = ["Lessons", "Duties", "Service", "Others"]
    
    var body: some View {
        NavigationView {
            VStack {
                DatePickerView(selectedDate: $selectedDate)
                
                Picker("", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if selectedCategory == "Lessons" {
                    TaskPickerView(tasks: getTasksByDate(lessons, selectedDate: selectedDate))
                } else if selectedCategory == "Duties"{
                    TaskPickerView(tasks: getTasksByDate(duties, selectedDate: selectedDate))
                } else if selectedCategory == "Service"{
                    TaskPickerView(tasks: getTasksByDate(service, selectedDate: selectedDate))
                } else if selectedCategory == "Others"{
                    OtherPickerView()
                }
            }
            .navigationTitle(resortName)
            .background(Color(UIColor.tertiarySystemGroupedBackground))
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
