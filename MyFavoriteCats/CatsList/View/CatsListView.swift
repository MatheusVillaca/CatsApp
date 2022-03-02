//
//  CatsListView.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 23/02/22.
//

import UIKit

final class CatsListView: UIView, ViewCode {
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: 175)
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(CatsListViewCell.self, forCellWithReuseIdentifier: "catsCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    } ()
    
    
    init (collectionViewDelegate: UICollectionViewDelegate, collectionViewDataSource: UICollectionViewDataSource) {
        super.init(frame: .zero)
        self.collectionView.delegate = collectionViewDelegate
        self.collectionView.dataSource = collectionViewDataSource
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
    
    func configureView() {
        backgroundColor = .black
        
    }
}
