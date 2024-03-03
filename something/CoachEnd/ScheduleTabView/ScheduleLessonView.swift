//
//  ScheduleLessonView.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//

import Foundation
import SwiftUI

struct ScheduleLessonView: View {
    var viewingInstructorName: String
    var lesson: LessonItem
    var body: some View {
        ScrollView {
            ZStack {
                Circle()
                    .fill(lesson.color)
                    .frame(width:150, height: 150)
                Text(lesson.emoji)
                    .font(.system(size: 80))
            }
            .padding(.top)
            Form {
                Section (header: Text("Summary")) {
                    HStack{
                        Spacer()
                        Text(String(lesson.numberOfParticipants))
                            .font(.system(size: 50))
                        Text("Kids,")
                        Text(String(lesson.listOfInstructors.count))
                            .font(.system(size: 50))
                        Text("Instructors")
                        Spacer()
                    }
                    .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 25))
                    Text("...")
                }
                
                Section (header: Text("Instructors")) {
                    HStack {
                        List {
                            ForEach(lesson.listOfInstructors) { item in
                                InstructorProfile(color: item.color, name: item.name)
                            }
                        }
                    }
                }
                
                
            }
            .frame(minWidth: 300, minHeight: 800)
            .scrollDisabled(true)
        }
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle(viewingInstructorName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InstructorProfile: View {
    var color: Color
    var name: String
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width:60, height: 60)
                Circle()
                    .fill(.white)
                    .frame(width:30, height: 30)
                Image(systemName: "person.fill")
                    .foregroundColor(color)
            }
            Text(name)
        }
        .padding()
    }
}

struct ScheduleLessonView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleLessonView(viewingInstructorName: "Sammy", lesson: exampleLessons[0])
    }
}
