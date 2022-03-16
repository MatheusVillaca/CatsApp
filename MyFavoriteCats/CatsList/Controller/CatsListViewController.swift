//
//  CatsListController.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 23/02/22.
//

import UIKit
import PKHUD

final class CatsListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CatsListViewCellDelegate {
    
    let api: CatAPI = .init()
    var cats: [Cats] = []
    
    lazy var catsView : CatsListView = .init(collectionViewDelegate: self, collectionViewDataSource: self)
    
    override func loadView() {
        view = catsView
        self.title = "Cats"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.viewToPresentOn = view
        PKHUD.sharedHUD.show()
        api.getCats { cats in
            DispatchQueue.main.async {
                PKHUD.sharedHUD.hide(afterDelay: 0) 
                self.cats = cats ?? []
                self.catsView.collectionView.reloadData()
            }
        }
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
        cell.setup(catBreed: cat.catBreed , catImageURL: cat.imageCat?.url, delegate: self, index: indexPath.item, isFavorite: isFavorite)
        return cell
    }
    
}
