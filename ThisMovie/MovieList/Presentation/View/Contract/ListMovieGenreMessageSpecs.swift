//
//  ListMovieGenreMessageSpecs.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

protocol ListMovieGenreInputMessageSpec {
    func loadGenres()
}

protocol ListMovieGenreOutputMessageSpec {
    associatedtype MovieGenre
    
    func completeLoad(_ genre: [MovieGenre])
}
