//
//  CatAPI.swift
//  MyFavoriteCats
//
//  Created by Matheus Villaça on 11/03/22.
//

import Foundation

final class CatAPI {
    
    var currentPage: Int = 1
    var limit: Int
    
    init(limit: Int = 20) {
        self.limit = limit
    }
    
    func getCats(completion: @escaping ((_ cats: [Cats]?)-> Void)) {
        guard var urlComponents: URLComponents = URLComponents(string: "https://api.thecatapi.com/v1/breeds") else {
            completion([])
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: "\(currentPage)"),
            URLQueryItem(name: "limit", value: "\(limit)")
        ]
        
        guard let url: URL = urlComponents.url else {
            completion([])
            return
        }
        
        let request: URLRequest = .init(url: url)
        RequestManager.request(request, completion: completion)
    }
}
