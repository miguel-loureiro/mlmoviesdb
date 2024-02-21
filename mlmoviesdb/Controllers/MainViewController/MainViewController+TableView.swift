//
//  MainViewController+TableView.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 29/12/2023.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func setupTableView() {

        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.tableView.backgroundColor = .clear
        self.registerCells()

    }

    func registerCells() {

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func reloadTableView() {

        DispatchQueue.main.async {

            self.tableView.reloadData()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {

        viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movieData = cellDataSource[indexPath.row]

        cell.textLabel?.text = self.viewModel.getMovieTitle(movieData)
        return cell
    }
}
