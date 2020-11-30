//
//  NetworkDataFetcher.swift
//  newsFeed
//
//  Created by Dava on 30.11.2020.
//

import Foundation
class NetworkDataFetcher {
    
    let networkService = NetworkService()
    
    func fetchTracks(urlString: String, response: @escaping (ArticleRespons?) -> Void) {
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let articles = try JSONDecoder().decode(ArticleRespons.self, from: data)
                    response(articles)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    response(nil)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
        }
    }
}
