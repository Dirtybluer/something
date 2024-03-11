//
//  ScheduleRow.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//

import Foundation
import SwiftUI

struct ScheduleRowView: View {
    var item: ScheduleItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text((item.startTime ?? "No Start Time") + " - " + (item.endTime ?? "No End Time") )
                .font(.subheadline)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .center)
                
            HStack {
                ZStack {
                    Circle()
                        .fill(item.color)
                        .frame(width: 60, height: 60)
                    Text(item.icon)
                        .font(.system(size: 40))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.scheduleName ?? "Name Not Provided")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(item.meetingPoint ?? "Meeting Point Not Provided")
                        .font(.caption)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    if (item.signUpNum != 0) {
                        HStack {
                            Image(systemName: "person.2.fill")
                                .font(.caption)
                            Text("\(item.signUpNum) Guests")
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "person.crop.rectangle.stack.fill")
                            .font(.caption)
                        Text("\(item.instructors.count) Instructors")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                }
                
            }
            .padding()
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct ScheduleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleRowView(item: exampleSchedule[1])
    }
}
