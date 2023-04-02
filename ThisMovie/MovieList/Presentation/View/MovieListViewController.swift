//
//  MovieListViewController.swift
//  ThisMovie
//
//  Created by Reynaldi on 01/04/23.
//

import UIKit

final class MovieListViewController: UITableViewController {
    
    private var genreItems = [MovieGenreItem]()
    private var selectedGenre: MovieGenreItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        loadGenres()
    }
    
    private func configureView() {
        tableView.separatorStyle = .none
    }
    
    private func loadGenres() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.genreItems = MovieGenreItem.prototypeData
            self.selectedGenre = self.genreItems.first
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
        cell.configureView(with: genreItems, ofSelected: selectedGenre)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension MovieListViewController: MovieGenreCellDelegate {
    func didSelect(_ genre: MovieGenreItem) {
        selectedGenre = genre
    }
}

private extension MovieGenreCell {
    func configureView(with genreModel: [MovieGenreItem], ofSelected genre: MovieGenreItem?) {
        configureView()
        genreCollectionModel.removeAll()
        genreCollectionModel = genreModel
        selectedGenre = genre
        genreCollectionView.reloadData()
    }
}
