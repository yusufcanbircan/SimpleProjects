//
//  MainMovieCell.swift
//  MovieMVVM
//
//  Created by Yusuf Can Bircan on 30.01.2023.
//

import UIKit
import SDWebImage
class MainMovieCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "MainMovieCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }
    
    @IBOutlet var backView: UIView!
    @IBOutlet var imageViewer: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addBorder(color: .label, width: 1)
        backView.backgroundColor = .lightGray
        backView.round()
        
        imageViewer.round(5)
    }
    
    func setupCell (viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.rateLabel.text = viewModel.rate
        self.dateLabel.text = viewModel.date
        self.imageViewer.sd_setImage(with: viewModel.imageUrl)
    }
    
}
