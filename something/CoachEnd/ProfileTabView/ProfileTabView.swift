//
//  ProfileTabView.swift
//  something
//
//  Created by 张萌琦 on 2024/3/11.
//

import SwiftUI

struct ProfileTabView: View {
    
    @Binding var viewingInstructorName: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    @State static var instructorName = "Sammy"

    static var previews: some View {
        ProfileTabView(viewingInstructorName: $instructorName)
    }
}
