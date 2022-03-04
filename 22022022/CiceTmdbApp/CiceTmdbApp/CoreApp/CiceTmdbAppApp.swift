//
//  CiceTmdbAppApp.swift
//  CiceTmdbApp
//
//  Created by CICE on 22/02/2022.
//

import SwiftUI
import Firebase

@main
struct CiceTmdbAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(LoginViewModel())
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
