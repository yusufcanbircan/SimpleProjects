//
//  MoviesCollectionViewCell.swift
//  MoviesAppWithFirebase
//
//  Created by Yusuf Can Bircan on 24.01.2023.
//

import UIKit

protocol MoviesCollectionViewCellProtocol {
    func addToChart(indexPath: IndexPath)
}

class MoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var collectionImageView: UIImageView!
    @IBOutlet var collectionNameLabel: UILabel!
    @IBOutlet var collectionPriceLabel: UILabel!
    
    var cellProtocol: MoviesCollectionViewCellProtocol?
    var indexPath: IndexPath?
    
    
    @IBAction func collectionAddToChartButton(_ sender: Any) {
        cellProtocol?.addToChart(indexPath: indexPath!)
    }
}
