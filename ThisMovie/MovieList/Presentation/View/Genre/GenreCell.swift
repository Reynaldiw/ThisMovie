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
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func configureDefaultView() {
        configureContainerView()
        configureLabel()
    }
    
    public func configureSelectedView() {
        containerView.backgroundColor = .darkGray
        genreLabel.textColor = .white
    }
    
    private func configureContainerView() {
        contentView.addSubview(containerView)
        containerView.frame = contentView.bounds
        containerView.clipsToBounds = true
        containerView.backgroundColor = .clear
        containerView.layer.cornerRadius = frame.size.height / 2
    }
    
    private func configureLabel() {
        containerView.addSubview(genreLabel)
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            genreLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            genreLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            genreLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
        ])
        genreLabel.textColor = .black
    }
}
