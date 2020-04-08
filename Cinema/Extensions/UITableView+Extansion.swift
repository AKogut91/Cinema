//
//  UITableView+Extansion.swift
//  Cinema
//
//  Created by AlexanderKogut on 4/9/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Foundation

import Foundation
import UIKit

extension UITableView {
    
    func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(UINib(nibName: String(describing: cellClass), bundle: nil), forCellReuseIdentifier: String(describing: cellClass))
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier,
                                                  for: indexPath) as? Cell else {
                                                    fatalError("Error for cell id: \(identifier) at \(indexPath))")
        }
        return cell
    }
}

