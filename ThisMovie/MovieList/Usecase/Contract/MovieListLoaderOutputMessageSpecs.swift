//
//  MovieListLoaderOutputMessageSpecs.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

protocol MovieGenreListLoaderOutputMessageSpecs {
    func succeedToFetch(_ movieGenres: [MovieGenreItem])
    func failedToFetchListMovieGenre(_ error: Error)
}

protocol MovieListLoaderOutputMessageSpecs: MovieGenreListLoaderOutputMessageSpecs {
    func succeedToFetch(_ movie: [MovieItem])
    func failedToFetchListMovie(_ error: Error)
}
