//
//  HomeViewCoordinator.swift
//  MiUserDefault
//
//  Created by CICE on 27/01/2022.
//

import UIKit

final class HomeViewCoordinator {
    
    static func homeView() -> UITabBarController {
        let homeVC = HomeViewController()
        
        let listaCochesVC = ListaCochesCoordinator.navigation()
        let listaPostsVC = ListaPostsCoordinator.navigation()
        
        let iconCoches = UITabBarItem(title: "Coches",
                                      image: UIImage(systemName: "house"),
                                      selectedImage: UIImage(systemName: "house.fill"))
        let iconPosts = UITabBarItem(title: "Post",
                                      image: UIImage(systemName: "house"),
                                      selectedImage: UIImage(systemName: "house.fill"))
        
        listaCochesVC.tabBarItem = iconCoches
        listaPostsVC.tabBarItem = iconPosts
        
        homeVC.viewControllers = [listaCochesVC, listaPostsVC]
        
        // TODO: - Tarea para los alumnos
        //var vc = RegistroCoordinator.view()
        //vc = nil
        
        return homeVC
    }
}



