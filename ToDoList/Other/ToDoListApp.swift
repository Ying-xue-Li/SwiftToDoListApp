//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
