//
//  MainViewController.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 29/12/2023.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: ViewModels
    var viewModel: MainViewModel = MainViewModel()

    override func viewDidLoad() {

        super.viewDidLoad()
        configView()
    }

    func configView() {

        self.title = "ML Movies"
        self.view.backgroundColor = .cyan

        setupTableView()
    }

    /// Async Await version
    override func viewDidAppear(_ animated: Bool) {

        Task {
            await viewModel.fetchData()
        }
    }
}
