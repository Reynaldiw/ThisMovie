//
//  MovieListViewController.swift
//  ThisMovie
//
//  Created by Reynaldi on 01/04/23.
//

import UIKit

final class MovieListViewController: UITableViewController {
    
    private enum MovieListSection: Int, CaseIterable {
        case genres = 0
        case movies
    }
    
    private var genreItems = [MovieGenreItem]()
    private var selectedGenre: MovieGenreItem?
    
    private var movieItems = [MovieItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        loadGenres()
    }
    
    private func configureView() {
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(MovieCell.nib, forCellReuseIdentifier: MovieCell.identifier)
    }
    
    private func loadGenres() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.genreItems = MovieGenreItem.prototypeData
            self.selectedGenre = self.genreItems.first
            self.tableView.reloadData()
            
            self.loadMovies()
        }
    }
    
    private func loadMovies() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.movieItems = MovieItem.prototypeData
            self.tableView.reloadSections([MovieListSection.movies.rawValue], with: .automatic)
        }
    }
}

extension MovieListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return MovieListSection.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = MovieListSection(rawValue: section)
        return section == .movies ? movieItems.count : 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = MovieListSection(rawValue: indexPath.section)
        
        if section == .genres {
            return getGenreCell(at: indexPath)
        }
        
        return getMovieCell(with: tableView, at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = MovieListSection(rawValue: indexPath.section)
        return section == .genres ? 72 : UITableView.automaticDimension
    }
    
    private func getGenreCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = MovieGenreCell()
        cell.delegate = self
        cell.configureView(with: genreItems, ofSelected: selectedGenre)
        
        return cell
    }
    
    private func getMovieCell(with tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < movieItems.count else { return UITableViewCell() }
        
        let model = movieItems[indexPath.row]
        let cell: MovieCell = tableView.dequeueReusableCell(at: indexPath)
        cell.configureView(with: model)
        
        return cell
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

private extension MovieCell {
    func configureView(with movie: MovieItem) {
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        releaseDateLabel.text = movie.releaseDate
        teaserImageView.backgroundColor = .red
    }
}

private extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: Bundle(for: self))
    }
}

private extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(at indexPath: IndexPath) -> T {
        let identifier = T.identifier
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }
}

private extension MovieItem {
    static var prototypeData: [MovieItem] {
        let movieItem: MovieItem = .init(id: 76600, posterImageURL: "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg", title: "Avatar: The Way of Water", overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.", releaseDate: "2022-12-14")
        
        return [movieItem, movieItem, movieItem, movieItem]
    }
}
