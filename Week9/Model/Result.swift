//
//  Result.swift
//  Week9
//
//  Created by Mehmet Salih ÇELİK on 2.12.2021.
//

import Foundation
import SwiftUI

struct Result: Decodable {
    
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case
            adult,id,overview,popularity,title,video,
            backdropPath = "backdrop_path",
            genreIds = "genre_ids",
            originalLanguage = "original_language",
            originalTitle = "original_title",
            posterPath = "poster_path",
            releaseDate = "release_date",
            voteAverage = "vote_average",
            voteCount = "vote_count"
    }
}
