//
//  UICollectionView+Extension.swift
//  ThisMovie
//
//  Created by Reynaldi on 02/04/23.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(at indexPath: IndexPath) -> T {
        let identifier = T.identifier
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
}
