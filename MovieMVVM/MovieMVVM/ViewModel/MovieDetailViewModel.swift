//
//  MovieDetailViewModel.swift
//  MovieMVVM
//
//  Created by Yusuf Can Bircan on 1.02.2023.
//

import Foundation

class MovieDetailViewModel {
    
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieOverview: String
    var movieId: Int
    
    init(movie: Movie) {
        self.movie = movie
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieOverview = movie.overview ?? ""
        self.movieId = movie.id
        self.movieImage = makeImageURL(movie.posterPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        return URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
