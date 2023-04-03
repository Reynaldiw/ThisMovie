//
//  UITableView+Extension.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(at indexPath: IndexPath) -> T {
        let identifier = T.identifier
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }
}
