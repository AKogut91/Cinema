//
//  UITableViewCell+Extension.swift
//  Cinema
//
//  Created by AlexanderKogut on 4/8/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import UIKit
import Foundation

extension UITableViewCell {
    
    func animationScaleCell(completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0.13,animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.07)
        }) { (completed) in
            UIView.animate(withDuration: 0.15,animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
                completion()
            })
        }
    }
}
