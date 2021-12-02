//
//  Result.swift
//  Week9
//
//  Created by Mehmet Salih ÇELİK on 2.12.2021.
//

struct Result: Decodable {
    let adult: Bool
    let backdrop_path: String?
    let genre_ids: [Int]
    let id: Int
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Double
    let poster_path: String?
    let release_date: String?
    let title: String?
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}
