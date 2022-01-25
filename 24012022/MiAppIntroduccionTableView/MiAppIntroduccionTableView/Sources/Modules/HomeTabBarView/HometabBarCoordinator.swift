//
//  HometabBarCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by CICE on 24/01/2022.
//

import UIKit

final class HometabBarCoordinator {
    
    static func tabBarController() -> UITabBarController{
        let tabVC = HometabBarViewController()
        
        // Controladores
        let listaMeses = ListaCochesCoordinator.navigation()
        let listaCoches = ListaSuperCochesCoordinator.navigation()
        
        // Iconos
        let listaMesesIcon = UITabBarItem(title: "Meses",
                                          image: UIImage(systemName: "house"),
                                          selectedImage: UIImage(systemName: "house.fill"))
        
        let listaCochesIcon = UITabBarItem(title: "Coches",
                                           image: UIImage(systemName: "car"),
                                           selectedImage: UIImage(systemName: "car.fill"))
        
        // Asignar el icono al controlador
        listaMeses.tabBarItem = listaMesesIcon
        listaCoches.tabBarItem = listaCochesIcon
        
        // Asignamos el array de controladores y su orden
        tabVC.viewControllers = [listaMeses, listaCoches]
        return tabVC
    }
}
