//
//  InstructorIconView.swift
//  something
//
//  Created by 张萌琦 on 2024/3/11.
//

import Foundation
import SwiftUI

struct InstructorIconView: View {
    var color: Color
    var name: String
    var icon: String
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width:60, height: 60)
                Text(icon)
                    .background(color)
                    .font(.system(size: 35))
                    
            }
            Text(name)
        }
        .padding()
    }
}

struct InstructorIconView_Previews: PreviewProvider {
    static var previews: some View {
        InstructorIconView(color: exampleInstructors[0].color,name: exampleInstructors[0].skiName, icon: exampleInstructors[0].icon)
    }
}
