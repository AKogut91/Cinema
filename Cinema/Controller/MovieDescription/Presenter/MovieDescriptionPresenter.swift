//
//  MovieDescriptionPresenter.swift
//  Cinema
//
//  Created by AlexanderKogut on 4/8/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Foundation
import UIKit

class MovieDescriptionPresenter {
    
    struct MovieDescription {
        var header = ""
        var titel = ""
    }
    
    enum MovieDesc: String {
        case Poster, Title, Year, Runtime, Director, Writer, Actors, Plot, Language
    }
    
    private var tableView: UITableView?
    private var movieDescription = [MovieDescription]()
    
    func get(view: CinemaView) {
        self.tableView = view.tableView
    }
    
    //MARK: - Network
    
    func loadMovieDescription(id: String) {
        Logger.Log("\(id)")
        NetworkService().getMovieDescription(id: id) { [unowned self] (movie) in
            self.movieDescription.append(MovieDescription.init(header: MovieDesc.Poster.rawValue, titel: movie.poster))
            self.movieDescription.append(MovieDescription.init(header: MovieDesc.Title.rawValue, titel: movie.title))
            self.movieDescription.append(MovieDescription.init(header: MovieDesc.Year.rawValue, titel: movie.year))
            self.movieDescription.append(MovieDescription.init(header: MovieDesc.Runtime.rawValue, titel: movie.runtime))
            self.movieDescription.append(MovieDescription.init(header: MovieDesc.Director.rawValue, titel: movie.director))
            self.movieDescription.append(MovieDescription.init(header: MovieDesc.Writer.rawValue, titel: movie.writer))
            self.movieDescription.append(MovieDescription.init(header: MovieDesc.Actors.rawValue, titel: movie.actors))
            self.movieDescription.append(MovieDescription.init(header: MovieDesc.Plot.rawValue, titel: movie.plot))
            self.movieDescription.append(MovieDescription.init(header: MovieDesc.Language.rawValue, titel: movie.language))
            self.tableView?.reloadData()
        }
    }
    
    //MARK: - TableVIew
    
    func removeView() {
        tableView = nil
    }
    
    func numberOfRows() -> Int {
        return movieDescription.count
    }
    
    func cellData(cell: UITableViewCell, indexPath: IndexPath) -> UITableViewCell {
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = movieDescription[indexPath.section].titel
        return cell
    }
    
    func headerTitle(section: Int) -> String {
        return movieDescription[section].header
    }
    
    func cellData(cell: PosterTableViewCell, indexPath: IndexPath) -> PosterTableViewCell {
        cell.configure(poster: movieDescription[indexPath.section].titel)
        return cell
    }
}
