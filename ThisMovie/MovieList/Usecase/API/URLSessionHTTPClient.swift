//
//  URLSessionHTTPClient.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

final class URLSessionHTTPClient: MovieListHTTPClient, MovieGenreListHTTPClient {
    struct UnexpectedValuesRepresentation: Error {}
    
    func getMovie(from url: URL, completion: @escaping (MovieListHTTPClient.Result) -> Void) {
        URLSessionHTTPClient.performGETFetch(to: url) { data, response, error in
            completion(Result{
                if let error = error {
                    throw error
                } else if let data, let response = response as? HTTPURLResponse {
                    return (data, response)
                } else {
                    throw UnexpectedValuesRepresentation()
                }
            })
        }
    }
    
    func getMovieGenre(from url: URL, completion: @escaping (MovieGenreListHTTPClient.Result) -> Void) {
        URLSessionHTTPClient.performGETFetch(to: url) { data, response, error in
            completion(Result{
                if let error = error {
                    throw error
                } else if let data, let response = response as? HTTPURLResponse {
                    return (data, response)
                } else {
                    throw UnexpectedValuesRepresentation()
                }
            })
        }
    }
    
    private static func performGETFetch(to url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
        }.resume()
    }
    
//    private static createURL(_ url: URL, request: [String: Any]) -> URL? {
//        var urlComponent = URLComponents(string: url.absoluteString)
//        urlComponent?.queryItems = createQueries(with: request)
//
//        return urlComponent?.url
//    }
//
//    private static func createQueries(with request: [String: Any]) -> [URLQueryItem] {
//        let request = request.mapValues { $0 as? String }.compactMapValues { $0 }
//        var queryItems = [URLQueryItem]()
//        request.forEach { key, value in
//            queryItems.append(URLQueryItem(name: key, value: value))
//        }
//
//        return queryItems
//    }
}
