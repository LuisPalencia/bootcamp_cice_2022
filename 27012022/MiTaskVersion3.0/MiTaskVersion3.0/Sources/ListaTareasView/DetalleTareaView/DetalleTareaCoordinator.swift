//
//  DetalleTareaCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 10/03/2022.
//

import UIKit

final class DetalleTareaCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view(dto: DetalleTareaCoordinatorDTO? = nil) -> UIViewController {
        let vc = DetalleTareaViewController()
        vc.dataModel = dto?.model
        return vc
    }
}

struct DetalleTareaCoordinatorDTO {
    var model: DownloadNewModel?
}
