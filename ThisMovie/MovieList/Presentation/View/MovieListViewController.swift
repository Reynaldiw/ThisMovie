//
//  MovieListViewController.swift
//  ThisMovie
//
//  Created by Reynaldi on 01/04/23.
//

import UIKit

final class MovieListViewController: UITableViewController {
    
    private var genreModel = [GenreItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGenres()
    }
    
    private func loadGenres() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.genreModel = GenreItem.prototypeData
            self.tableView.reloadData()
        }
    }
}

extension MovieListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MovieGenreCell()
        cell.delegate = self
        cell.configureView(with: genreModel)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension MovieListViewController: MovieGenreCellDelegate {
    func didSelect(_ genre: MovieGenreViewModel) {
        print("Selected genre \(genre)")
    }
}

private extension MovieGenreCell {
    func configureView(with genreModel: [GenreItem]) {
        configureView()
        genreCollectionModel.removeAll()
        genreCollectionModel = genreModel.toViewModels()
        genreCollectionView.reloadData()
    }
}

private extension GenreItem {
    static var prototypeData: [GenreItem] {
        return [
            GenreItem(id: 28, name: "Action"),
            GenreItem(id: 28, name: "Adventure"),
            GenreItem(id: 28, name: "Animation"),
            GenreItem(id: 28, name: "Comedy"),
            GenreItem(id: 28, name: "Crime"),
            GenreItem(id: 28, name: "Documentary"),
            GenreItem(id: 28, name: "Drama"),
            GenreItem(id: 28, name: "Family")
        ]
    }
}

private extension Collection where Element == GenreItem {
    func toViewModels() -> [MovieGenreViewModel] {
        return map { .init(name: $0.name) }
    }
}
