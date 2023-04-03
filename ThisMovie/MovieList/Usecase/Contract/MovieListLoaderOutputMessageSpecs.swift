//
//  MovieListLoaderOutputMessageSpecs.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

protocol MovieGenreListLoaderOutputMessageSpecs {
    typealias MovieGenreResult = Swift.Result<[MovieGenreItem], Error>
    
    func completeFetch() -> MovieGenreResult
}

protocol MovieListLoaderOutputMessageSpecs: MovieGenreListLoaderOutputMessageSpecs {
    typealias MovieResult = Swift.Result<[MovieItem], Error>

    func completeFetch() -> MovieResult
}
