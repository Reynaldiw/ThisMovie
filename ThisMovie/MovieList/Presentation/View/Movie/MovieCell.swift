//
//  MovieCell.swift
//  ThisMovie
//
//  Created by Reynaldi on 01/04/23.
//

import UIKit

final class MovieCell: UITableViewCell {
    
    @IBOutlet private(set) var teaserImageView: UIImageView!
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var overviewLabel: UILabel!
    @IBOutlet private(set) var releaseDateLabel: UILabel!
    
}
