//
//  ProfileHeaderView.swift
//  something
//
//  Created by 张萌琦 on 2024/3/11.
//

import SwiftUI

struct ProfileHeaderView: View {
    let viewingInstructor: Instructor
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                Circle()
                    .fill(viewingInstructor.color)
                    .frame(width:80, height: 80)
                Text(viewingInstructor.icon)
                    .background(viewingInstructor.color)
                    .font(.system(size: 45))
                    
            }
            Spacer()
            VStack {
                Text(viewingInstructor.skiName)
                    .bold()
                    .font(.title)
                Text(viewingInstructor.name + " / " + viewingInstructor.skill)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    ProfileHeaderView(viewingInstructor: exampleInstructors[0])
}
