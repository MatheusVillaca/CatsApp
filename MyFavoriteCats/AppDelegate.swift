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
        
        let barAppearence = UITabBarAppearance()
        barAppearence.backgroundColor = .cyan
        barAppearence.selectionIndicatorTintColor = .systemBlue
        
        let tabViewController: TabBarController = .init(nibName: nil, bundle: nil)
        tabViewController.tabBar.barTintColor = .black
        tabViewController.tabBar.unselectedItemTintColor = .black
        tabViewController.tabBar.standardAppearance = barAppearence;
        if #available(iOS 15.0, *) {
            tabViewController.tabBar.scrollEdgeAppearance = tabViewController.tabBar.standardAppearance
        }
        
        let window: UIWindow = .init(frame: UIScreen.main.bounds)
        window.rootViewController = tabViewController
        self.window = window
        window.makeKeyAndVisible()
        return true
    }

   

}

