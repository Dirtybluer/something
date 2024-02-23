//
//  ScheduleItem.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//

import Foundation
import SwiftUI

struct ScheduleItem: Identifiable {
    let id = UUID()
    let timeRange: String
    let name: String
    let numberOfParticipants: Int
    let numberOfCoach: Int
    let location: String
    let imageName: String
}
