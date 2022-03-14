//
//  View.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 14/03/22.
//

import UIKit

final class CategoriesView: UIView, ViewCode {
  
    let categoriesTableView: UITableView = {
        let categoriesTableView: UITableView = UITableView(frame: .zero)
        categoriesTableView.translatesAutoresizingMaskIntoConstraints = false
        categoriesTableView.register(CategorieCell.self, forCellReuseIdentifier: "categorieCell")
        return categoriesTableView
    } ()
    
    init(dataSource: UITableViewDataSource, delegade: UITableViewDelegate) {
        self.categoriesTableView.delegate = delegade
        self.categoriesTableView.dataSource = dataSource
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy() {
        addSubview(categoriesTableView)
    }
    
    func setupConstraints() {
        categoriesTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        categoriesTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        categoriesTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        categoriesTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func configureView() {
        backgroundColor = .white
    }
}
