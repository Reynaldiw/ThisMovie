//
//  MovieItemPrototypeData.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

extension MovieItem {
    static var prototypeData: [MovieItem] {
        let movieItem: MovieItem = .init(id: 76600, posterImageURL: "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg", title: "Avatar: The Way of Water", overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.", releaseDate: "2022-12-14")
        
        return [movieItem, movieItem, movieItem, movieItem]
    }
}
