//
//  MovieGenreCell.swift
//  ThisMovie
//
//  Created by Reynaldi on 01/04/23.
//

import UIKit

final class MovieGenreCell: UITableViewCell {
    
    public var genreCollectionModel = [MovieGenreViewModel]()
    
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
        return CGSize(width: 100, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

private extension GenreCell {
    func configureView(with genreName: String) {
        configureDefaultView()
        genreLabel.text = genreName
    }
}
