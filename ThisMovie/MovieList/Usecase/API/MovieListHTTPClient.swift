//
//  MovieListHTTPClient.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

protocol MovieListHTTPClient {
    typealias Result = Swift.Result<[MovieItem], Error>
    
    func getMovie(from url: URL, request: [String: Any], completion: @escaping (Result) -> Void)
}
