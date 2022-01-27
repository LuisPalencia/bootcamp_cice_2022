//
//  AppDelegate.swift
//  MiUserDefault
//
//  Created by CICE on 27/01/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoreCoordinator: AppCoreCoordinatorProtocol = AppCoreCoordinator()



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let windowUnw = self.window {
            self.appCoreCoordinator.initialViewControler(window: windowUnw)
        }
        
        return true
    }
    

    

}

