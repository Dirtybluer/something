//
//  SchoolTabView.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//
import SwiftUI


struct SchoolTabView: View  {
    private var resort = "Tomamu"

    @State private var selectedDate: Date = Date()
    
    @State private var selectedCategory: String = "Lessons"
    let categories = ["Lessons", "Duties", "Service", "Others"]
    
    var body: some View {
        NavigationView {
            VStack {
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
                    TaskPickerView(tasks: lessons)
                } else if selectedCategory == "Duties"{
                    TaskPickerView(tasks: duties)
                } else if selectedCategory == "Service"{
                    TaskPickerView(tasks: service)
                }
            }
            .navigationTitle(resort)
            .background(Color(UIColor.systemGroupedBackground))
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
