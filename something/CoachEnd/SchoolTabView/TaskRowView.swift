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
            Image(systemName: item.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .background(Circle().fill(Color.blue.opacity(0.2)))
                .clipShape(Circle())


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

struct TaskItem: Identifiable {
    var id = UUID()
    var icon: String
    var category: String
    var title: String
    var time: String
    var instructors: [String]
    var numOfGuests: Int
}
