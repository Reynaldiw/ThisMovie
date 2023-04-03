//
//  URLSessionHTTPClient.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

final class URLSessionHTTPClient: MovieListHTTPClient, MovieGenreListHTTPClient {
    struct UnexpectedValuesRepresentation: Error {}
    
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    func getMovie(from url: URL, completion: @escaping (MovieListHTTPClient.Result) -> Void) {
        URLSessionHTTPClient.performGETFetch(to: url) { completion($0) }
    }
    
    func getMovieGenre(from url: URL, completion: @escaping (MovieGenreListHTTPClient.Result) -> Void) {
        URLSessionHTTPClient.performGETFetch(to: url) { completion($0) }
    }
    
    private static func performGETFetch(to url: URL, completion: @escaping (Result) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(map(data: data, response: response, error: error))
        }.resume()
    }
    
    private static func map(data: Data?, response: URLResponse?, error: Error?) -> Result {
        return Result{
            if let error = error {
                throw error
            } else if let data, let response = response as? HTTPURLResponse {
                return (data, response)
            } else {
                throw UnexpectedValuesRepresentation()
            }
        }
    }
}
