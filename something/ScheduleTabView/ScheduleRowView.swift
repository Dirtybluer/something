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
            Text(item.timeRange)
                .font(.subheadline)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .center)
                
            HStack {
                Image(systemName: item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(12)
                    .background(Color.orange.opacity(0.2))
                    .clipShape(Circle())
                    .foregroundColor(.orange)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(item.location)
                        .font(.caption)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    if (item.numberOfParticipants != 0) {
                        HStack {
                            Image(systemName: "person.2.fill")
                                .font(.caption)
                            Text("\(item.numberOfParticipants) Kids")
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "person.crop.rectangle.stack.fill")
                            .font(.caption)
                        Text("\(item.numberOfCoach) Coaches")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                }
                
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.horizontal, 8)
    }
}

struct ScheduleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleRowView(item: ScheduleItem(timeRange: "9:00 - 11:00", name: "Small - AM", numberOfParticipants: 5, numberOfCoach: 3, location: "Kids Room", imageName: "sun.min.fill"))
    }
}
