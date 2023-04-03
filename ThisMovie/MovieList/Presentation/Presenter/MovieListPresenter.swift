//
//  MovieListPresenter.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

final class MovieListPresenter<OutputSpecs: ListMovieOutputMessageSpec>: ListMovieInputMessageSpec where OutputSpecs.Movie == MovieItem, OutputSpecs.MovieGenre == MovieGenreItem {
    
    var viewOutputMessage: OutputSpecs?
    
    init(viewOutputMessage: OutputSpecs?) {
        self.viewOutputMessage = viewOutputMessage
    }
    
    func loadMovies() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.viewOutputMessage?.completeLoad(MovieItem.prototypeData)
        }
    }
    
    func loadGenres() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.viewOutputMessage?.completeLoad(MovieGenreItem.prototypeData)
        }
    }
}
