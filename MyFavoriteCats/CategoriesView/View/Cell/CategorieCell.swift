//
//  CategorieCell.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 14/03/22.
//

import UIKit

final class CategorieCell: UITableViewCell, ViewCode {
   
    var name: UILabel = {
        var name: UILabel = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.numberOfLines = 0
        return name
    }()
    
//    var id: UILabel = {
//        var id: UILabel = UILabel(frame: .zero)
//        id.translatesAutoresizingMaskIntoConstraints = false
//        id.numberOfLines = 0
//        return id
//    }()
    
    func setupCategories(name: String) {
        self.name.text = name
//        self.id.text = id
        setupView()
    }
    
    
    func setupViewHierarchy() {
        contentView.addSubview(name)
//        contentView.addSubview(id)
    }
    
    func setupConstraints() {
        name.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        name.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        name.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
//        id.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4).isActive = true
//        id.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//        id.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        id.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func configureView() {
        backgroundColor = .white
    }
}
