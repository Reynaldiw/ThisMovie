//
//  MovieListHTTPClient.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

protocol MovieGenreListHTTPClient {
    typealias Result = Swift.Result<[MovieGenreItem], Error>
    
    func getMovieGenre(from url: URL, completion: @escaping (Result) -> Void)
}

protocol MovieListHTTPClient {
    typealias Result = Swift.Result<[MovieItem], Error>
    
    func getMovie(from url: URL, request: [String: Any], completion: @escaping (Result) -> Void)
}
