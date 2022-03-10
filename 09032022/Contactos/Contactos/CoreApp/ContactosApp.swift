//
//  ContactosApp.swift
//  Contactos
//
//  Created by CICE on 09/03/2022.
//

import SwiftUI

@main
struct ContactosApp: App {
    
    let persistanceVM = PersistanceViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanceVM.container.viewContext)
        }
    }
}
