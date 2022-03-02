//
//  AppDelegate.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 23/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window: UIWindow = .init(frame: UIScreen.main.bounds)
        window.rootViewController = TabBarController()
        self.window = window
        window.makeKeyAndVisible()
        return true
    }

   

}

