//
//  MovieListMessageInput.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

protocol ListMovieInputMessageSpec: ListMovieGenreInputMessageSpec {
    func loadMovies()
}

protocol ListMovieOutputMessageSpec: ListMovieGenreOutputMessageSpec {
    associatedtype Movie
    
    func completeLoad(_ movie: [Movie])
}
