//
//  DetalleContactoCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 31/01/2022.
//

import UIKit

final class DetalleContactoCoordinator{
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view(dto: DetalleContactoCoordinatorDTO? = nil) -> UIViewController {
        let vc = DetalleContactoViewController()
        vc.dataModel = dto?.model
        return vc
    }
}

struct DetalleContactoCoordinatorDTO {
    var model: Contact?
}
