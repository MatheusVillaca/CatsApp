//
//  FavoriteCatsController.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 23/02/22.
//

import UIKit

final class FavoriteCatsListController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CatsListViewCellDelegate{
    
    var favoriteCats: [Cats] {
        return CatsManager.getFavoriteCats()
    }
    
    func favoriteAction(index: Int) {
        CatsManager.remove(at: index)
        catsView.collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        catsView.collectionView.reloadData()
    }
    
    lazy var catsView : CatsListView = .init(collectionViewDelegate: self, collectionViewDataSource: self)
    
    override func loadView() {
        view = catsView
        self.title = "favoriteCats"
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteCats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell: CatsListViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "catsCell", for: indexPath) as? CatsListViewCell else {
            return UICollectionViewCell()
        }
        let cat: Cats = favoriteCats[indexPath.item]
        let isFavorite: Bool = CatsManager.isCatFavorite(cat)
        cell.setup(catBreed: cat.catBreed, catImageURL: cat.imageCat?.url, delegate: self, index: indexPath.item, isFavorite: isFavorite)
        return cell
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let updatedFavoriteCats: Data = try? JSONEncoder().encode(favoriteCats) {
            UserDefaults.standard.setValue(updatedFavoriteCats, forKey: "favoriteCats")
        }
    
    }
    
}
