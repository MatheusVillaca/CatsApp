//
//  CatsManager.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 02/03/22.
//

import Foundation

final class CatsManager {
    
    static func getFavoriteCats() -> [Cats] {
        guard let favoriteCatsData: Data = UserDefaults.standard.value(forKey: "favoriteCats") as? Data,
              let favoriteCats: [Cats] = try? JSONDecoder().decode([Cats].self, from: favoriteCatsData) else {
                  return []
              }
        
        return favoriteCats
    }
    
    static func updateFavoriteCats(cats: [Cats]) {
        if let updatedFavoriteCatsData: Data = try? JSONEncoder().encode(cats) {
            UserDefaults.standard.setValue(updatedFavoriteCatsData, forKey: "favoriteCats")
        }
    }
    
    static func isCatFavorite(_ cat: Cats) -> Bool {
        let favoriteCats: [Cats] = getFavoriteCats()
        return !favoriteCats.filter({ cat == $0 }).isEmpty
    }
    
    static func getFavoriteIndex(breed: String) -> Int? {
        let favoriteCats: [Cats] = getFavoriteCats()
        
        guard let cat: Cats = favoriteCats.first(where: { $0.catBreed == breed }) else { return nil }
        return favoriteCats.firstIndex(of: cat)
    }
    
    static func remove(at index: Int) {
        var favoriteCats: [Cats] = getFavoriteCats()
        favoriteCats.remove(at: index)
        updateFavoriteCats(cats: favoriteCats)
    }
}
