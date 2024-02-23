//
//  MovieDetailsViewModel.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 22/02/2024.
//

import Foundation

class MovieDetailsViewModel {

    var movie: Movie

    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieId: Int

    init(movie: Movie) {

        self.movie = movie
        self.movieId = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDescription = movie.overview ?? ""
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
    }
    
    private func makeImageURL( _ imageCode: String) -> URL? {

        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
