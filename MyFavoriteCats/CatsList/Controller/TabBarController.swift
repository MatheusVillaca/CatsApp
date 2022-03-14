//
//  UITabBarController.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 24/02/22.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBar.barTintColor = .systemTeal
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.tintColor = .systemBlue
        
        let categorieController = CategoriesViewController()
        let tabCategorieBarItem = UITabBarItem(title: "Categories", image: UIImage(named: "categorieIcon"), selectedImage: UIImage(named: "categorieIcon"))
        categorieController.tabBarItem = tabCategorieBarItem
        
        let listCats = CatsListViewController()
        let tabCatsBarItem = UITabBarItem ( title: "Cats" , image: UIImage ( named: "icons8-gato-25" ) , selectedImage: UIImage ( named: "icons8-gato-25" ))
        listCats.tabBarItem = tabCatsBarItem
        
        let favoriteCats = FavoriteCatsListController()
        let tabFavoriteCatsBarItem = UITabBarItem (title: "Favorite Cats", image: UIImage(named: "icons8-cat-25"), selectedImage: UIImage(named: "icons8-cat-25"))
        favoriteCats.tabBarItem = tabFavoriteCatsBarItem
        
        self.viewControllers = [listCats, favoriteCats, categorieController]
    }
    
}
