//
//  MovieDetailsViewController.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 22/02/2024.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    /// Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    /// View Model
    var viewModel: MovieDetailsViewModel
    
    init(viewModel: MovieDetailsViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: "MovieDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        
        
        self.title = "Movie details"
        titleLabel.text = viewModel.movieTitle
        descriptionLabel.text = viewModel.movieDescription
        
        Task {
            let image = try await ImageFetcher().get(url: viewModel.movieImage)
            
            DispatchQueue.main.async {
                self.imageView.image = image
                self.imageView.clipsToBounds = true
            }
        }
    }
}
