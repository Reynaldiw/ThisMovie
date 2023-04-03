//
//  MovieListHTTPClient.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

protocol MovieListHTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    func getMovie(from url: URL, completion: @escaping (Result) -> Void)
}
