//
//  MoviePosterTableViewCell.swift
//  Cinema
//
//  Created by AlexanderKogut on 4/8/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import UIKit

class MoviePosterTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var moviePoster: UIImageView!
    @IBOutlet weak private var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func configureCell(movie: Search) {
        moviePoster.downloaded(from: movie.poster)
        movieTitle.text = movie.title
    }
    
    func configureCell(poster: String) {
        moviePoster.contentMode = .scaleToFill
        moviePoster.downloaded(from: poster)
        movieTitle.isHidden = true
    }
}
