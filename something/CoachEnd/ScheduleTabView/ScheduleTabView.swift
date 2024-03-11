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
    
    var viewingInstructorName: String
    
    @StateObject private var viewModel: ScheduleTabViewModel
    
    init(viewingInstructorName: String) {
        self.viewingInstructorName = viewingInstructorName
        _viewModel = StateObject(wrappedValue: ScheduleTabViewModel(viewingIntructorSkiName: viewingInstructorName))
    }
    
    //todo: 当viewingInstructorName变化时，viewmodel也应该发生变化

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                DatePickerView(selectedDate: $viewModel.selectedDate)
                    .onChange(of: viewModel.selectedDate) { newValue in
                            viewModel.pullShowedScheduleItems()
                        }
                if viewModel.showedScheduleItems.count == 0 {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("Schedule is Empty")
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        Spacer()
                    }
                } else {
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
            }
            .navigationTitle(viewingInstructorName.capitalized)
            .background(Color(UIColor.tertiarySystemGroupedBackground))
        }
        .onAppear() {
            viewModel.setViewingInstructorName(name: viewingInstructorName)
            viewModel.pullShowedScheduleItems()
        }
    }
}


struct ScheduleTabView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleTabView(viewingInstructorName: "Sammy")
    }
}
