//
//  ProfileTabView.swift
//  something
//
//  Created by 张萌琦 on 2024/3/11.
//

import SwiftUI

struct ProfileTabView: View {
    
    @Binding var viewingInstructorName: String
    
    @State var today: Date = Date()  // Add this line
    
    var viewingInstructor: Instructor {
        Instructor.getInstructor(skiName: viewingInstructorName)!
    }
    
    var body: some View {
        NavigationView() {
            Form {
                Section {
                    ProfileHeaderView(viewingInstructor: viewingInstructor)
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color(UIColor.tertiarySystemGroupedBackground))
                
                Section (header: Text("Timesheet")) {
                    ProfileTimeSheetView(viewingInstructorName: viewingInstructorName, today: $today)
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color(UIColor.tertiarySystemGroupedBackground))
                
                Section {
                    HStack {
                        Text("Top Lesson")
                        Spacer()
                        Text("Tiger")
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Top Service")
                        Spacer()
                        Text("Ski Pro Shop")
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Delayed Days Off")
                        Spacer()
                        Text("0")
                            .foregroundColor(.gray)
                    }
                }
                
                
                Section (header: Text("Uniform")) {
                    ProfileUniformView()
                }
            }
            .navigationTitle("My Profile")
            .background(Color(UIColor.tertiarySystemGroupedBackground))
        }
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    @State static var instructorName = "Sammy"

    static var previews: some View {
        ProfileTabView(viewingInstructorName: $instructorName)
    }
}
