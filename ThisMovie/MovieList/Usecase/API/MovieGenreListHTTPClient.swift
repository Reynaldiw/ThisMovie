//
//  MovieGenreListHTTPClient.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

protocol MovieGenreListHTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    func getMovieGenre(from url: URL, completion: @escaping (Result) -> Void)
}
