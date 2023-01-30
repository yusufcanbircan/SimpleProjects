//
//  MovieTableCellViewModel.swift
//  MovieMVVM
//
//  Created by Yusuf Can Bircan on 30.01.2023.
//

import Foundation

class MovieTableCellViewModel {
    var id: Int
    var title: String
    var rate: String
    var date: String
    var imageUrl: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.name ?? movie.title ?? ""
        self.rate = "\(movie.voteAverage)/10"
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.imageUrl = makeImageURL(movie.posterPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        return URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
