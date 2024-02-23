//
//  MainMovieCell.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 21/02/2024.
//

import UIKit

class MainMovieCell: UITableViewCell {

    public static var identifier: String {

        get {

            return "MainMovieCell"
        }
    }

    public static func register() -> UINib {

        UINib(nibName: "MainMovieCell", bundle: nil)
    }

    ///IBOutlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.addBorder(color: .label, width: 1.0)
        backView.round()
        backView.backgroundColor = .lightGray
        movieImageView.round(5.0)
    }

    func setupCell(viewModel: MovieTableCellViewModel) {

        Task {
            let image = try await ImageFetcher().get(url: viewModel.imageUrl)

            DispatchQueue.main.async {
                self.movieImageView.image = image
                self.movieImageView.clipsToBounds = true
            }
        }

        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
    }
}
