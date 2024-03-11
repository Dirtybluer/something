//
//  AssistantRowView.swift
//  something
//
//  Created by Charles Blue on 2024/3/11.
//

import Foundation
import SwiftUI

struct AssistantRowView : View {
    var item : AssistantItem

    var body : some View {
        HStack {
            AvaterView(bgColor: item.bgColor)

            VStack(alignment: .leading, spacing: 2) {
                Text(item.name)
                    .font(.headline)
                Text(item.department)
                    .font(.subheadline)
            }
        }
    }
}


