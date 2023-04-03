//
//  MovieListLoaderOutputMessageSpecs.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

protocol MovieGenreListLoaderOutputMessageSpecs {
    associatedtype Genre
    
    func completeFetch() -> Swift.Result<[Genre], Error>
}

protocol MovieListLoaderOutputMessageSpecs: MovieGenreListLoaderOutputMessageSpecs {
    associatedtype Movie
    
    func completeFetch() -> Swift.Result<[Movie], Error>
}
