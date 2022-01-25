//
//  AppCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by CICE on 24/01/2022.
//

import UIKit

protocol AppCoordinatorProtocol {
    func setPrincipalViewController(window: UIWindow)
    
    
}


final class AppCoordinator {
    var actualViewController: UIViewController?
    
}


extension AppCoordinator: AppCoordinatorProtocol {
    func setPrincipalViewController(window: UIWindow){
        //self.actualViewController = UIViewController()
        //self.actualViewController = ListaCochesCoordinator.navigation()
        self.actualViewController = HometabBarCoordinator.tabBarController()
        window.rootViewController = actualViewController
        window.makeKeyAndVisible()
    }
}
