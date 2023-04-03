//
//  UITableViewCell+Extension.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: Bundle(for: self))
    }
}
