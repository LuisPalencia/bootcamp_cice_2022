//
//  PersistanceViewModel.swift
//  Contactos
//
//  Created by CICE on 10/03/2022.
//

import CoreData

struct PersistanceViewModel {
    
    static let shared = PersistanceViewModel()
    
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "Contactos")
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { (storeDescription, error) in
            if let errorUnw = error as NSError? {
                fatalError("Error desconocido: \(errorUnw), \(errorUnw.userInfo)")
            }
        }
    }
}
