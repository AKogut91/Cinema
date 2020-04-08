//
//  CinemaViewController.swift
//  Cinema
//
//  Created by AlexanderKogut on 4/8/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import UIKit

protocol CinemaView: class {
    var tableView: UITableView! { get }
}

class CinemaViewController: UIViewController, CinemaView {
    
    var tableView: UITableView!
    private var presenter: CinemaPresenter!
    
    init(with presenter: CinemaPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = CinemaPresenter()
        self.setTable()
        self.presenter.get(view: self)
        self.presenter.loadMovieData()
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
                                              height: self.view.frame.height - 20))
        tableView.registerCell(MoviePosterTableViewCell.self)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.mask = nil
        view.addSubview(tableView)
    }
}

extension CinemaViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MoviePosterTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        return presenter.cellData(cell: cell, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MoviePosterTableViewCell {
            cell.animationScaleCell { [unowned self] in
                let vc = MovieDescriptionViewController(with: MovieDescriptionPresenter(), id: self.presenter.getMovieId(indexPath: indexPath))
                vc.modalPresentationStyle = .formSheet
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
}
