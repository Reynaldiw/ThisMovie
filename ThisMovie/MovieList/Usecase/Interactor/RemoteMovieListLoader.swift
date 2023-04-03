//
//  RemoteMovieListLoader.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

final class RemoteMovieListLoader<OutputSpec: MovieListLoaderOutputMessageSpecs>: MovieListLoaderInputMessageSpecs where OutputSpec.Movie == MovieItem, OutputSpec.Genre == MovieGenreItem {
    
    private var loaderOutputMessage: OutputSpec?
    
    func fetchListMovie() {}
    func fetchListMovieGenre() {}
}
