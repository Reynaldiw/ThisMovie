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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func configureView() {
        containerView.frame = contentView.bounds
        containerView.layer.cornerRadius = frame.size.height / 2
        containerView.clipsToBounds = true
        contentView.addSubview(containerView)
        
        containerView.addSubview(genreLabel)
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            genreLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            genreLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            genreLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
        ])
    }
}
