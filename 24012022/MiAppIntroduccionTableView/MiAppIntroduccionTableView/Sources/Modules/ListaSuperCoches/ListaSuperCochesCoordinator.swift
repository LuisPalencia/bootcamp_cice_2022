//
//  ListaSuperCochesCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by CICE on 24/01/2022.
//

import UIKit

final class ListaSuperCochesCoordinator {
    // Comodin
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    // Vista
    static func view() -> UIViewController {
        let vc = ListaSuperCochesViewController()
        return vc
    }
}
