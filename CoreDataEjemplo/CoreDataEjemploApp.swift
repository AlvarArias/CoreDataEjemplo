//
//  CoreDataEjemploApp.swift
//  CoreDataEjemplo
//
//  Created by Alvar Arias on 2022-07-28.
//

import SwiftUI

@main
struct CoreDataEjemploApp: App {
    
     @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
