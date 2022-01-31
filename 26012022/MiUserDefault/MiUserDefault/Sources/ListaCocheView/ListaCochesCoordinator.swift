//
//  ListaCochesCoordinator.swift
//  MiUserDefault
//
//  Created by CICE on 27/01/2022.
//

import UIKit

final class ListaCochesCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = ListaCochesViewController()
        return vc
    }
}
