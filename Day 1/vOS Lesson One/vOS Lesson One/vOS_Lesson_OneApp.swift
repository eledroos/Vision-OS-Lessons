//
//  vOS_Lesson_OneApp.swift
//  vOS Lesson One
//
//  Created by Nasser Eledroos on 7/7/24.
//

import SwiftUI

@main
struct vOS_Lesson_OneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "Mars") {
            ImmersiveView()
        }
    }
}
