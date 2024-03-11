//
//  ProfileUniformView.swift
//  something
//
//  Created by 张萌琦 on 2024/3/11.
//

import SwiftUI

struct ProfileUniformView: View {
    var body: some View {
        HStack {
            Text("Jacket")
            Spacer()
            Text("J33 - XL")
                .foregroundColor(.gray)
        }
        HStack {
            Text("Pants")
            Spacer()
            Text("P56 - L")
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ProfileUniformView()
}
