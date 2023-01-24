//
//  MoviesViewController.swift
//  MoviesAppWithFirebase
//
//  Created by Yusuf Can Bircan on 24.01.2023.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var movies = [Filmler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let designFlow: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let width = self.collectionView.frame.size.width
        
        designFlow.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let cellWidth = (width-30)/2
        
        designFlow.itemSize = CGSize(width: cellWidth, height: cellWidth*1.75)
        
        designFlow.minimumInteritemSpacing = 10
        designFlow.minimumLineSpacing = 10
        
        collectionView.collectionViewLayout = designFlow
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let index = sender as? Int {
                
                
                let vc = segue.destination as! DetailsViewController
                vc.movie = movies[index]
            } else {
                print("no inform")
            }
        }
    }
    

}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource, MoviesCollectionViewCellProtocol {
    func addToChart(indexPath: IndexPath) {
        print("\(movies[indexPath.row].film_ad!) added to chart!")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = movies[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MoviesCollectionViewCell
        
        cell.collectionImageView.image = UIImage(named: movie.film_resim!)
        cell.collectionNameLabel.text = movie.film_ad
        cell.collectionPriceLabel.text = "14.99 $"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
    
}
