//
//  Cats.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 23/02/22.
//

import Foundation


final class Cats: Codable, Equatable {
    
    let catBreed: String
    let imageCat: String
    
    init(catBreed: String, imageCat: String) {
        self.catBreed = catBreed
        self.imageCat = imageCat
    }
    
    static func == (lhs: Cats, rhs: Cats) -> Bool {
        return lhs.catBreed == rhs.catBreed
    }
}
