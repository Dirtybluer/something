//
//  SchefuleTabView.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//

import Foundation
import SwiftUI
import CoreData

struct ScheduleTabView: View {
    
    @StateObject private var viewModel: ScheduleTabViewModel
    
    init(context: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: ScheduleTabViewModel(context: context))
    }

    var body: some View {
        let viewingInstructorName: String = self.viewModel.viewingIntructorSkiName
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
                    ForEach(viewModel.showedScheduleItems) { item in
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
        .onAppear(perform: viewModel.pullShowedScheduleItems)
        
    }
}


struct ScheduleTabView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleTabView(context: CoreDataStack.preview.persistentContainer.viewContext)
    }
}
