//
//  MoviesViewModel.swift
//  Week9
//
//  Created by Mehmet Salih ÇELİK on 2.12.2021.
//

struct MoviesViewModel {
    
    var movies: [Result]
    
    var getMovieCount: Int {
        return movies.count
    }
    
    func getMovieTitle(indexPath: Int) -> String {
        return self.movies[indexPath].title ?? ""
    }
    
    func getMovieImagePath(indexPath: Int) -> String {
        return self.movies[indexPath].poster_path ?? ""
    }
}
