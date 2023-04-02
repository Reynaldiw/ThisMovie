//
//  GenreCell.swift
//  ThisMovie
//
//  Created by Reynaldi on 01/04/23.
//

import UIKit

final class GenreCell: UICollectionViewCell {
    
    public var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    public var genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    public func configureView() {
        containerView.frame = contentView.bounds
        containerView.layer.cornerRadius = frame.size.height / 2
        containerView.clipsToBounds = true
        addSubview(containerView)
        
        addSubview(genreLabel)
        genreLabel.center = containerView.center
    }
}
