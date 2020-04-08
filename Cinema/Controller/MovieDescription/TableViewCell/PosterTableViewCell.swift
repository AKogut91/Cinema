//
//  PosterTableViewCell.swift
//  Cinema
//
//  Created by AlexanderKogut on 4/9/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import UIKit

class PosterTableViewCell: UITableViewCell {

    @IBOutlet weak private var poster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
    }

    func configure(poster: String) {
        self.poster.downloaded(from: poster)
        self.poster.contentMode = .scaleAspectFill
    }
    
}
