//
//  TaskRowView.swift
//  something
//
//  Created by Charles Blue on 2024/3/10.
//
import Foundation
import SwiftUI

struct TaskRowView : View {
    var item : TaskItem

    var body : some View {
        HStack {
            ZStack {
                Circle()
                    .fill(item.bgColor)
                    .frame(width:60, height: 60)
                Text(item.icon)
                    .font(.system(size: 40))
            }

            VStack(alignment: .leading, spacing: 2) {
                HStack{
                    Text(item.title)
                        .font(.headline)
                    Spacer()
                    if (item.numOfGuests > 0){
                        Text("\(item.numOfGuests) Guests")
                            .font(.subheadline)
                    }
                }
                Text(item.time)
                    .font(.subheadline)
                Text("Instructors: \(item.instructors.joined(separator: ", "))")
                    .font(.subheadline)
            }
        }
    }
}

