//
//  MovieListLoaderSpecs.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

protocol MovieGenreListLoaderInputMessageSpecs {
    func fetchListMovieGenre()
}

protocol MovieListLoaderInputMessageSpecs: MovieGenreListLoaderInputMessageSpecs {
    func fetchListMovie()
}
