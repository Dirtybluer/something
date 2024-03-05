//
//  somethingApp.swift
//  something
//
//  Created by Charles Blue on 2024/2/22.
//

import SwiftUI

@main
struct somethingApp: App {
    @StateObject private var coreDataStack = CoreDataStack.shared
    
    var body: some Scene {
        WindowGroup {
            if UIDevice.current.userInterfaceIdiom == .pad {
                ManagerEndView()
            } else {
                CoachEndView()
                    .environment(\.managedObjectContext, coreDataStack.persistentContainer.viewContext)
            }
        }
    }
}
