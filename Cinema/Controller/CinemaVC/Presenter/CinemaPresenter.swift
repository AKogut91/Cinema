//
//  CinemaPresenter.swift
//  Cinema
//
//  Created by AlexanderKogut on 4/8/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Foundation
import UIKit


class CinemaPresenter {
    
    private var searchModel = [Search]()
    private var tableView: UITableView?
    
    func get(view: CinemaView) {
        self.tableView = view.tableView        
    }
        
    func removeView() {
        self.tableView = nil
    }
    
    func numberOfRows() -> Int {
        return searchModel.count
    }
    
    func cellData(cell: MoviePosterTableViewCell, indexPath: IndexPath) -> MoviePosterTableViewCell {
        cell.configureCell(movie: searchModel[indexPath.row])
       return cell
    }
    
    func loadMovieData() {
        NetworkService.init().getSearchMovie { [unowned self] (obj) in
            self.searchModel = obj
            self.tableView?.reloadData()
        }
    }
    
    func getMovieId(indexPath: IndexPath) -> String {
        return searchModel[indexPath.row].imdbID
    }
}
