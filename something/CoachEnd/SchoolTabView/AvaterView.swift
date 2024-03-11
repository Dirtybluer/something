//
//  AvaterView.swift
//  something
//
//  Created by Charles Blue on 2024/3/11.
//

import Foundation
import SwiftUI

struct AvaterView : View {
    var bgColor : Color
    
    var body : some View{
        ZStack {
            Circle()
                .fill(bgColor)
                .frame(width:60, height: 60)
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width:30, height: 30)
        }
    }
}

struct AvaterWithNameView : View {
    var bgColor : Color
    var name: String
    
    var body : some View{
        VStack{
            AvaterView(bgColor: bgColor)
            Text(name)
        }
    }
}
