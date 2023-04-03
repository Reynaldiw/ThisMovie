//
//  MovieGenreMapper.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

final class MovieGenreMapper {
    private struct Root: Decodable {
        let genres: [RemoteMovieGenreItem]
    }
    
    private static var OK_200: Int {
        return 200
    }
    
    static func map(data: Data, response: HTTPURLResponse) throws -> [RemoteMovieGenreItem] {
        guard response.statusCode == OK_200, let root = try? JSONDecoder().decode(Root.self, from: data)
        else { throw RemoteMovieListLoader.Error.invalidData }
        
        return root.genres
    }
}
