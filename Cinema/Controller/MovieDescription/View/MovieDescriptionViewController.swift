//
//  MovieDescriptionViewController.swift
//  Cinema
//
//  Created by AlexanderKogut on 4/8/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import UIKit

class MovieDescriptionViewController: UIViewController, CinemaView {

    var tableView: UITableView!
    private var presenter: MovieDescriptionPresenter!
    
    init(with presenter: MovieDescriptionPresenter, id: String) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.setTable()
        self.presenter.get(view: self)
        self.presenter.loadMovieDescription(id: id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        presenter.removeView()
    }
    
    private func setTable() {
        tableView = UITableView(frame: CGRect(x: 0, y: 20,
                                              width: self.view.frame.width,
                                              height: self.view.frame.height - 60))
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(PosterTableViewCell.self)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.mask = nil
        view.addSubview(tableView)
    }
}

extension MovieDescriptionViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: PosterTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            return presenter.cellData(cell: cell, indexPath: indexPath)
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
            return presenter.cellData(cell: cell, indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.headerTitle(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
}
