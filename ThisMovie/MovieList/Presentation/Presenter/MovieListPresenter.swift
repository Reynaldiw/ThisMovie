//
//  MovieListPresenter.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

final class MovieListPresenter<OutputSpecs: ListMovieOutputMessageSpec> where OutputSpecs.Movie == MovieItem, OutputSpecs.MovieGenre == MovieGenreItem {
    
    var viewOutputMessage: OutputSpecs?
    var usecaseInputMessage: MovieListLoaderInputMessageSpecs?
}

extension MovieListPresenter: ListMovieInputMessageSpec {
    func loadMovies() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.viewOutputMessage?.completeLoad(MovieItem.prototypeData)
        }
    }
    
    func loadGenres() {
        usecaseInputMessage?.fetchListMovieGenre()
    }
}

extension MovieListPresenter: MovieListLoaderOutputMessageSpecs {
    func succeedToFetch(_ movie: [MovieItem]) {
    }
    
    func failedToFetchListMovie(_ error: Error) {
        
    }
    
    func succeedToFetch(_ movieGenres: [MovieGenreItem]) {
        self.viewOutputMessage?.completeLoad(movieGenres)
    }
    
    func failedToFetchListMovieGenre(_ error: Error) {
        print("ERROR FETCH GENRE \(error)")
    }
}
