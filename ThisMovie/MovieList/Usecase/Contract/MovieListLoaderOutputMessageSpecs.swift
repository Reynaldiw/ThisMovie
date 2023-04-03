//
//  MovieListLoaderOutputMessageSpecs.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

protocol MovieGenreListLoaderOutputMessageSpecs {
    associatedtype Genre
    typealias Result = Swift.Result<[Genre], Error>
    
    func completeFetch() -> Result
}

protocol MovieListLoaderOutputMessageSpecs: MovieGenreListLoaderOutputMessageSpecs {
    associatedtype Movie
    typealias Result = Swift.Result<[Movie], Error>
    
    func completeFetch() -> Result
}
