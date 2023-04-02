//
//  MovieGenreCell.swift
//  ThisMovie
//
//  Created by Reynaldi on 01/04/23.
//

import UIKit

struct MovieGenreViewModel {
    let name: String
}

final class MovieGenreCell: UITableViewCell {
    
    private var genreCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView()
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
    
    private func configureView() {
        genreCollectionView.frame = bounds
        addSubview(genreCollectionView)
    }
}
