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
        let listaPerfilPost = ListaPerfilPostCoordinator.navigation()
        
        // Iconos
        let listaMesesIcon = UITabBarItem(title: "Meses",
                                          image: UIImage(systemName: "house"),
                                          selectedImage: UIImage(systemName: "house.fill"))
        
        let listaCochesIcon = UITabBarItem(title: "Coches",
                                           image: UIImage(systemName: "car"),
                                           selectedImage: UIImage(systemName: "car.fill"))
        
        let listaPerfilPostIcon = UITabBarItem(title: "Feed",
                                           image: UIImage(systemName: "person"),
                                           selectedImage: UIImage(systemName: "person.fill"))
        
        // Asignar el icono al controlador
        listaMeses.tabBarItem = listaMesesIcon
        listaCoches.tabBarItem = listaCochesIcon
        listaPerfilPost.tabBarItem = listaPerfilPostIcon
        
        // Asignamos el array de controladores y su orden
        tabVC.viewControllers = [listaMeses, listaCoches, listaPerfilPost]
        return tabVC
    }
}
