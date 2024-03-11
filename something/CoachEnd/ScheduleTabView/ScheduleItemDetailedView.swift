//
//  ScheduleLessonView.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//

import Foundation
import SwiftUI

struct ScheduleItemDetailedView: View {
    var viewingInstructorName: String
    var scheduleItem: ScheduleItem
    var body: some View {
        ScrollView {
            ZStack {
                Circle()
                    .fill(scheduleItem.color)
                    .frame(width:130, height: 130)
                Text(scheduleItem.icon)
                    .font(.system(size: 70))
            }
            .padding(.top)
            Form {
                Section (header: Text("Summary")) {
                    HStack{
                        Spacer()
                        Text(String(scheduleItem.signUpNum))
                            .font(.system(size: 45))
                        Text("Guests,")
                        Text(String(scheduleItem.instructors.count))
                            .font(.system(size: 45))
                        Text("Instructor")
                        Spacer()
                    }
                    .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 25))
                    HStack {
                        Spacer()
                        if scheduleItem.scheduleDescribe == "-" {
                            Text("No Description")
                        } else {
                            Text(scheduleItem.scheduleDescribe)
                        }
                        Spacer()
                    }
                    .foregroundColor(Color.gray)
                }
                
                Section (header: Text("Instructors")) {
                    HStack {
                        ForEach(scheduleItem.instructors, id: \.self) { instructorName in
                            
                            let instructor = Instructor.getInstructor(skiName: instructorName)
                            
                            InstructorIconView(color: instructor?.color ?? Color.gray, name: instructor?.skiName ?? "None")
                            }
                    }
                }
                
                Section (header: Text("Lesson Details")) {
                    HStack {
                        Text("Date")
                        Spacer()
                        Text(generateStringFromDate(date: scheduleItem.date) ?? "Date Not Avaliable")
                            .foregroundColor(Color.gray)
                    }
                    HStack {
                        Text("Lesson Time")
                        Spacer()
                        Text(scheduleItem.startTime + " - " + scheduleItem.endTime)
                            .foregroundColor(Color.gray)
                    }
                    if let meetingPoint = scheduleItem.meetingPoint {
                        HStack {
                            Text("Meeting Point")
                            Spacer()
                            Text(meetingPoint)
                                .foregroundColor(Color.gray)
                        }
                    }
                }
            }
            .frame(minWidth: 300, minHeight: 800)
            .scrollDisabled(true)
        }
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle(scheduleItem.scheduleName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ScheduleLessonView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleItemDetailedView(viewingInstructorName: "BENJAMIN", scheduleItem: exampleSchedule[0])
    }
}
