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
                Image(systemName: "sun.min.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(12)
                    .background(Color.orange.opacity(0.2))
                    .clipShape(Circle())
                    .foregroundColor(.orange)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.scheduleName ?? "Name Not Provided")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(item.meetingPoint ?? "Meeting Point Not Provided")
                        .font(.caption)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    if (item.signUpNumber != 0) {
                        HStack {
                            Image(systemName: "person.2.fill")
                                .font(.caption)
                            Text("\(item.signUpNumber) Kids")
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "person.crop.rectangle.stack.fill")
                            .font(.caption)
                        Text("\(item.instructors?.count ?? 0) Coaches")
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

//struct ScheduleRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScheduleRowView(item: exampleLessons[1])
//    }
//}
