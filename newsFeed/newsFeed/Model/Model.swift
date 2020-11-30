//
//  Model.swift
//  newsFeed
//
//  Created by Dava on 30.11.2020.
//

import Foundation

struct ArticleRespons:Decodable {
    var num_results: Int
    var results: [Article]
}

struct Article:Decodable {
    var section: String?
    var title: String?
    var abstract: String?
    var url: String?
    
}
