//
//  CategoriesApi.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 14/03/22.
//

import Foundation

struct Categories: Codable {
    var name: String
//    var id: String
}


final class CategoriesApi {
    
    func getCategories(completion: @escaping ((_ categories: [Categories]? ) -> Void) ) {
        guard let urlComponents: URLComponents = URLComponents(string: "https://api.thecatapi.com/v1/categories") else {
            completion([])
            return 
        }
        
        guard let url: URL = urlComponents.url else {
            completion([])
            return
        }
        
        let request: URLRequest = .init(url: url)
        RequestManager.request(request, completion: completion)
    }
}
