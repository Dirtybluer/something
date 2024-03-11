//
//  InstructorIconView.swift
//  something
//
//  Created by 张萌琦 on 2024/3/11.
//

import Foundation
import SwiftUI

struct InstructorIconView: View {
    var color: Color = Color.orange
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
