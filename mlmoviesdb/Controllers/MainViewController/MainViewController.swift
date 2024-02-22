//
//  MainViewController.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 29/12/2023.
//

import UIKit
import Foundation

class MainViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: ViewModels
    var viewModel: MainViewModel = MainViewModel()

    // MARK: variables
    var cellDataSource: [MovieTableCellViewModel] = []

    override func viewDidLoad() {

        super.viewDidLoad()
        configView()
        bindViewModel()
    }

    /// Async Await version
    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(false)

        Task {

            await viewModel.getData()
        }
    }

    func configView() {

        self.title = "ML Movies"
        self.view.backgroundColor = .systemBackground

        setupTableView()
    }

    func bindViewModel() {

        viewModel.isLoading.bind { [weak self] isLoading in

            guard let self = self, let isLoading = isLoading else {

                return
            }

            DispatchQueue.main.async {

                if isLoading {

                    self.activityIndicator.startAnimating()
                } else {

                    self.activityIndicator.stopAnimating()
                }
            }
        }

        viewModel.cellDataSource.bind { [weak self] movies in
            
            guard let self = self, let movies = movies else {

                return
            }

            self.cellDataSource = movies
            self.reloadTableView()

        }
    }
}
