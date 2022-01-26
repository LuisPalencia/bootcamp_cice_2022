//
//  ListaPerfilPostCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by CICE on 25/01/2022.
//

import UIKit

final class ListaPerfilPostCoordinator {
    // Comodin
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: self.view())
        return navVC
    }
    
    // Vista
    static func view() -> UIViewController {
        let vc = ListaPerfilPostViewController()
        return vc
    }
}
