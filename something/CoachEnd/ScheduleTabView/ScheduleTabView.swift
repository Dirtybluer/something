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
    
    @StateObject private var viewModel: ScheduleTabViewModel = ScheduleTabViewModel()
    

    var body: some View {
        let viewingInstructorName: String = self.viewModel.viewingIntructorSkiName
        NavigationView {
            VStack(spacing: 20) {
                DatePickerView(selectedDate: $viewModel.selectedDate)
                    .onChange(of: viewModel.selectedDate) { newValue in
                            viewModel.pullShowedScheduleItems()
                        }
                
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
            .navigationTitle(viewingInstructorName.capitalized)
            .background(Color(UIColor.tertiarySystemGroupedBackground))
        }
        .onAppear(perform: viewModel.pullShowedScheduleItems)
        
    }
}


struct ScheduleTabView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleTabView()
    }
}
