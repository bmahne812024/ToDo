//
//  ToDoApp.swift
//  ToDo
//
//  Created by Brian Mahne on 12/6/24.
//

import SwiftUI
import SwiftData
@main
struct ToDoApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .modelContainer(for: ToDo.self)
        }
    }
    init() {
        print(URL.applicationSupportDirectory.path())
    }
}
