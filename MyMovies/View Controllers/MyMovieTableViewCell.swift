//
//  MyMovieTableViewCell.swift
//  MyMovies
//
//  Created by Dennis Rudolph on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MyMovieTableViewCell: UITableViewCell {
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var myMovieTitleLabel: UILabel!
    @IBOutlet weak var myMovieWatchedButton: UIButton!
    
    // MARK: - Methods
    
    @IBAction func watchedButtonTapped(_ sender: UIButton) {
        guard let movie = movie else { return }
        
        MovieController.shared.updateMovieWatched(movie: movie)
        
        var buttonTitle = ""
        if movie.hasWatched {
            buttonTitle = "Watched"
        } else {
            buttonTitle = "Unwatched"
        }
        myMovieWatchedButton.setTitle(buttonTitle, for: .normal)
    }
    
    func updateViews() {
        guard let movie = movie else { return }
        myMovieTitleLabel.text = movie.title
        var buttonTitle = ""
        if movie.hasWatched {
            buttonTitle = "Watched"
        } else {
            buttonTitle = "Unwatched"
        }
        myMovieWatchedButton.setTitle(buttonTitle, for: .normal)
    }
}
