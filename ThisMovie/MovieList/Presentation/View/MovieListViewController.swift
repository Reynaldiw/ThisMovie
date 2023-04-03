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
    
    typealias Movie = MovieItem
    typealias MovieGenre = MovieGenreItem
    
    private var inputMessage: MovieListPresenter<MovieListViewController>!
    
    private var genreItems = [MovieGenreItem]()
    private var selectedGenre: MovieGenreItem?
    
    private var movieItems = [MovieItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change composition later
        let url = URL(string: "https://api.themoviedb.org/3")!
        let client: MovieListHTTPClient & MovieGenreListHTTPClient = URLSessionHTTPClient()
        let interactorInput = RemoteMovieListLoader(url: url, client: client)
        inputMessage = MovieListPresenter<MovieListViewController>()
        interactorInput.loaderOutputMessage = inputMessage
        inputMessage.usecaseInputMessage = interactorInput
        inputMessage.viewOutputMessage = self
                
        configureView()
        inputMessage.loadGenres()
    }
    
    private func configureView() {
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(MovieCell.nib, forCellReuseIdentifier: MovieCell.identifier)
    }
}

extension MovieListViewController: ListMovieOutputMessageSpec {
    func completeLoad(_ movie: [MovieItem]) {
        movieItems = movie
        tableView.reloadSections([MovieListSection.movies.rawValue], with: .automatic)
    }
    
    func completeLoad(_ genre: [MovieGenreItem]) {
        genreItems = genre
        selectedGenre = genre[0]
        DispatchQueue.main.async {
            self.tableView.reloadSections([MovieListSection.genres.rawValue], with: .automatic)
        }
        
        inputMessage.loadMovies()
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
