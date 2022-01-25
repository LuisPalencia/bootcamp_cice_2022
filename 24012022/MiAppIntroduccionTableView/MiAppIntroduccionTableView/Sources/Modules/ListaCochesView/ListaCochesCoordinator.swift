//
//  ListaCochesCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by CICE on 24/01/2022.
//

import UIKit

final class ListaCochesCoordinator {
    
    // Comodin
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: self.view())
        return navVC
    }
    
    // Vista
    static func view() -> UIViewController {
        let vc = ListaCochesViewController()
        return vc
    }
    
    
    
}
