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
            if let url = URL(string: "http://kasimadalan.pe.hu/filmler/resimler/\(movie.film_resim!).png") {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url)
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data!)
                    }
                }
            }
            nameLabel.text = movie.film_ad
            categoryLabel.text = movie.kategori_ad
            releaseDateLabel.text = "\(movie.film_yil!)"
            directorNameLabel.text = movie.yonetmen_ad
        }
    }

}
