//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by Akash Gamage on 2024-01-01.
//

import FirebaseCore
import SwiftUI

@main
struct To_Do_ListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
