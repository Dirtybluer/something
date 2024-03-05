//
//  SchefuleTabView.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//

import Foundation
import SwiftUI

struct ScheduleTabView: View {
    
    @StateObject private var viewModel = ScheduleTabViewModel()
    
    var viewingInstructorName: String = "Sammy"

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                HStack {
                    Button(action: { viewModel.updateDate(by: -1) }) {
                        Image(systemName: "chevron.left")
                    }
                    Text(dateFormatter.string(from: viewModel.selectedDate))
                        .font(.title3)
                        .fontWeight(.bold)
                    Button(action: { viewModel.updateDate(by: 1) }) {
                        Image(systemName: "chevron.right")
                    }
                    
                    Spacer()
                    
//                    NavigationLink(destination: ScheduleCalendarView(date: viewModel.selectedDate, schedule: viewModel.showedScheduleItems)) {
//                        Image(systemName: "calendar")
//                            .font(.title3)
//                    }
            
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
}


struct ScheduleTabView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleTabView()
    }
}
