//
//  Movies.swift
//  Week9
//
//  Created by Mehmet Salih ÇELİK on 2.12.2021.
//

struct Movies: Decodable {
    let page: Int
    let results: [Result]
    let total_pages: Int
    let total_results: Int
}
