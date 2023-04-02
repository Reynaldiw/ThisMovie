//
//  MovieGenreCell.swift
//  ThisMovie
//
//  Created by Reynaldi on 01/04/23.
//

import UIKit

protocol MovieGenreCellDelegate: AnyObject {
    func didSelect(_ genre: MovieGenreItem)
}

final class MovieGenreCell: UITableViewCell {
    
    public var genreCollectionModel = [MovieGenreItem]()
    public weak var delegate: MovieGenreCellDelegate?
    
    public var genreCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
}

extension MovieGenreCell {
    public func configureView() {
        contentView.addSubview(genreCollectionView)
        NSLayoutConstraint.activate([
            genreCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            genreCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            genreCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            genreCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        genreCollectionView.register(GenreCell.self, forCellWithReuseIdentifier: GenreCell.identifier)
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
    }
}

extension MovieGenreCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genreCollectionModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard genreCollectionModel.count > indexPath.item else { return UICollectionViewCell() }
        
        let genre = genreCollectionModel[indexPath.item]
        let cell: GenreCell = collectionView.dequeueReusableCell(at: indexPath)
        cell.configureView(with: genre.name)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard genreCollectionModel.count > indexPath.item else { return .zero }

        let genreName = genreCollectionModel[indexPath.item].name
        var width = (genreName as NSString).size(withAttributes: [.font: UIFont.systemFont(ofSize: 14.5)]).width
        width += 16 /* 16: Spacing leading + Trailing */
        
        return CGSize(width: width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard genreCollectionModel.count > indexPath.item else { return }
        
        let selectedModel = genreCollectionModel[indexPath.item]
        delegate?.didSelect(selectedModel)
    }
}

private extension GenreCell {
    func configureView(with genreName: String) {
        configureDefaultView()
        genreLabel.text = genreName
    }
}
