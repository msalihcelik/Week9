//
//  Movies.swift
//  Week9
//
//  Created by Mehmet Salih ÇELİK on 2.12.2021.
//

struct Movies: Decodable {
    
    let page: Int
    let results: [Result]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page,results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
