//
//  AppCoreCoordinator.swift
//  MiUserDefault
//
//  Created by CICE on 27/01/2022.
//

import UIKit

protocol AppCoreCoordinatorProtocol {
    func initialViewControler(window: UIWindow)
}

final class AppCoreCoordinator {
    var actualVC: UIViewController?
}


extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    func initialViewControler(window: UIWindow) {
        
        if Utils.Constants().kPrefs.bool(forKey: Utils.Constants().kUserLogado){
            self.actualVC = HomeViewCoordinator.homeView()
        }else{
            self.actualVC = RegistroCoordinator.view()
        }
        
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
    
    private func muestraRutaUserDefault() {
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
    }
}
