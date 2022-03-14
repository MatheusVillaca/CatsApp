//
//  CategoriesViewController.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 14/03/22.
//

import UIKit

final class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var categoriesApi: CategoriesApi = .init()
    var categories: [Categories] = []
  
    lazy var categorieView: CategoriesView = .init(dataSource: self, delegade: self)
    
    override func loadView() {
        view = categorieView
        self.title = "Categories"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        categoriesApi.getCategories { categories in
            DispatchQueue.main.async {
                self.categories = categories ?? []
                self.categorieView.categoriesTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CategorieCell = tableView.dequeueReusableCell(withIdentifier: "categorieCell", for: indexPath) as? CategorieCell else {
            return UITableViewCell()
        }
        let categorie: Categories = categories[indexPath.row]
        cell.setupCategories(name: categorie.name)
        return cell
    }
}
