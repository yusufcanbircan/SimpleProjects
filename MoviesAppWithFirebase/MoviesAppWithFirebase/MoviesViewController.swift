//
//  MoviesViewController.swift
//  MoviesAppWithFirebase
//
//  Created by Yusuf Can Bircan on 24.01.2023.
//

import UIKit
import Firebase

class MoviesViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var movies = [Filmler]()
    var category: String?
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        if let category {
            self.navigationItem.title = category
            moviesByCategory(category: category)
        }
        
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
    
    func moviesByCategory(category: String) {
        
        let request = ref.child("filmler").queryOrdered(byChild: "kategori_ad").queryEqual(toValue: category)
        
        request.observe(.value, with: { snapshot in
            if let fetchedData = snapshot.value as? [String: AnyObject] {
                
                self.movies.removeAll()
                
                for row in fetchedData {
                    
                    if let dict = row.value as? NSDictionary {
                        let key = row.key
                        let film_ad = dict["film_ad"] as? String ?? ""
                        let film_yil = dict["film_yil"] as? Int ?? 0
                        let film_resim = dict["film_resim"] as? String ?? ""
                        let yonetmen_ad = dict["yonetmen_ad"] as? String ?? ""
                        let kategori_ad = dict["kategori_ad"] as? String ?? ""
                        let film = Filmler(film_id: key, film_ad: film_ad, film_yil: film_yil, film_resim: film_resim, kategori_ad: kategori_ad, yonetmen_ad: yonetmen_ad)
                        
                        self.movies.append(film)
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
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
        
        if let url = URL(string: "http://kasimadalan.pe.hu/filmler/resimler/\(movie.film_resim!).png") {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    cell.collectionImageView.image = UIImage(data: data!)
                }
            }
        }
        
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
