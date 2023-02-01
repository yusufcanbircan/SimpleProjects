//
//  MovieDetailViewController.swift
//  MovieMVVM
//
//  Created by Yusuf Can Bircan on 1.02.2023.
//

import UIKit

class MovieDetailViewController: UIViewController {

    // IBOutlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    // View Model
    var viewModel: MovieDetailViewModel
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "MovieDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func configView() {
        self.title = "Movie Details"
        titleLabel.text = viewModel.movieTitle
        overviewLabel.text = viewModel.movieOverview
        imageView.sd_setImage(with: viewModel.movieImage)
    }
    
}
