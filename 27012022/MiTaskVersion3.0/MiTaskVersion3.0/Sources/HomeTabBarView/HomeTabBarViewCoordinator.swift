//
//  HomeTabBarViewCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 31/01/2022.
//

import UIKit

final class HomeTabBarViewCoordinator {
    
    static func homeViewController() -> UITabBarController {
        let homeVC = HomeTabBarViewController()
        // Controladores
        let contactosVC = ContactosViewCoordinator.navigation()
        let nuevaTareaVC = NuevaTareaViewCoordinator.navigation()
        let listaTareasVC = ListaTareasViewCoordinator.navigation()
        
        // Iconos
        let iconContacto = UITabBarItem(title: "Mis contactos",
                                        image: UIImage(systemName: "person.crop.circle"),
                                        selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        let iconNuevaTarea = UITabBarItem(title: "Nueva tarea",
                                        image: UIImage(systemName: "pencil.and.outline"),
                                        selectedImage: UIImage(systemName: "pencil.and.outline"))
        let iconListaTareas = UITabBarItem(title: "Mis contactos",
                                        image: UIImage(systemName: "text.redaction"),
                                        selectedImage: UIImage(systemName: "text.redaction"))
        
        // Asignamos icono -> controladores
        contactosVC.tabBarItem = iconContacto
        nuevaTareaVC.tabBarItem = iconNuevaTarea
        listaTareasVC.tabBarItem = iconListaTareas
        
        // Asignamos controladores al TabBar
        homeVC.viewControllers = [contactosVC, nuevaTareaVC, listaTareasVC]
        
        return homeVC
    }
}
