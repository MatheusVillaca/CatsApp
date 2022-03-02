//
//  CatsListController.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 23/02/22.
//

import UIKit

final class CatsListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CatsListViewCellDelegate {
    
    
    var cats: [Cats] = [.init(catBreed: "Bengal", imageCat: "bengal"),
                        .init(catBreed: "Gato de Pelo Curto Inglês", imageCat: "gato-de-pelo-curto-ingles"),
                        .init(catBreed: "Main Coon", imageCat: "main-coon"),
                        .init(catBreed: "Munchkin", imageCat: "Munchkin"),
                        .init(catBreed: "Norwegian Forest", imageCat: "norwegian-forest-cat"),
                        .init(catBreed: "Persa", imageCat: "persa"),
                        .init(catBreed: "Ragdoll", imageCat: "ragdoll"),
                        .init(catBreed: "Savannah", imageCat: "Savannah"),
                        .init(catBreed: "Siames", imageCat: "siames"),
                        .init(catBreed: "Sphynx", imageCat: "sphynx")]
    
    lazy var catsView : CatsListView = .init(collectionViewDelegate: self, collectionViewDataSource: self)
    
    override func loadView() {
        view = catsView
        self.title = "Cats"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        catsView.collectionView.reloadData()
    }
    
    func favoriteAction(index: Int) {
        let favoriteCat: Cats = cats[index]
        var favoriteCats: [Cats] = CatsManager.getFavoriteCats()
        if CatsManager.isCatFavorite(favoriteCat) {
            if let favoriteIndex: Int = CatsManager.getFavoriteIndex(breed: favoriteCat.catBreed) {
                favoriteCats.remove(at: favoriteIndex)
            }
        } else {
            favoriteCats.append(favoriteCat)
        }
        
        CatsManager.updateFavoriteCats(cats: favoriteCats)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell: CatsListViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "catsCell", for: indexPath) as? CatsListViewCell else {
            return UICollectionViewCell()
        }
        let cat: Cats = cats[indexPath.item]
        let isFavorite: Bool = CatsManager.isCatFavorite(cat)
        cell.setup(catBreed: cat.catBreed , catImage: UIImage(named: cat.imageCat), delegate: self, index: indexPath.item, isFavorite: isFavorite)
        return cell
    }
    
}
