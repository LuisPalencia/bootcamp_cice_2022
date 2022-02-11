//
//  SplashRouter.swift
//  CiceMusic
//
//  Created by CICE on 07/02/2022.
//

import Foundation

// Input del Router
protocol SplashRouterInputProtocol {
    func showHometabBarRouter(dataSource: [GenericResult])
    func showAlert(title: String, message: String)
}

final class SplashRouter: BaseRouter<SplashViewController> {
    
}

// Input del Router
extension SplashRouter: SplashRouterInputProtocol {
    func showHometabBarRouter(dataSource: [GenericResult]) {
        DispatchQueue.main.async {
            let vc = HomeTabBarCoordinator.tabBarController(dto: HomeTabBarCoordinatorDTO(data: dataSource))
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.viewController?.present(vc, animated: true, completion: nil)
        }
        
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            self.viewController?.present(Utils.showAlert(title: title, message: message), animated: true, completion: nil)
        }
        
    }
}