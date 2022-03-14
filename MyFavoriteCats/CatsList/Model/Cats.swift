//
//  Cats.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 23/02/22.
//

import Foundation

struct Image: Codable {
    let url: URL
}


final class Cats: Codable, Equatable {
    
    let catBreed: String
    let imageCat: Image?
    
    private enum CodingKeys : String, CodingKey {
        case catBreed = "name"
        case imageCat = "image"
    }
    
    init(catBreed: String, imageCat: Image) {
        self.catBreed = catBreed
        self.imageCat = imageCat
    }
    
    static func == (lhs: Cats, rhs: Cats) -> Bool {
        return lhs.catBreed == rhs.catBreed
    }
}
