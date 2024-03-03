//
//  somethingApp.swift
//  something
//
//  Created by Charles Blue on 2024/2/22.
//

import SwiftUI

@main
struct somethingApp: App {
    var body: some Scene {
        WindowGroup {
            if UIDevice.current.userInterfaceIdiom == .pad {
                ContentView()
            } else {
                CoachEndView()
            }
        }
    }
}
