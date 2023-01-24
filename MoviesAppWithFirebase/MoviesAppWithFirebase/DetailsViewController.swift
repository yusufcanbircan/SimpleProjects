//
//  DetailsViewController.swift
//  MoviesAppWithFirebase
//
//  Created by Yusuf Can Bircan on 24.01.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var directorNameLabel: UILabel!
    
    var movie: Filmler?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie {
            imageView.image = UIImage(named: movie.film_resim!)
            nameLabel.text = movie.film_ad
            categoryLabel.text = movie.kategori_ad
            releaseDateLabel.text = "\(movie.film_yil!)"
            directorNameLabel.text = movie.yonetmen_ad
        }
    }

}
