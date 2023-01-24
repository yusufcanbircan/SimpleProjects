//
//  ViewController.swift
//  MoviesAppWithFirebase
//
//  Created by Yusuf Can Bircan on 24.01.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var categories = [Kategoriler]()
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ref = Database.database().reference()
        
        fetchAllCategory()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovies" {
            if let index = sender as? Int {
                
                let vc = segue.destination as! MoviesViewController
                vc.category = categories[index].kategori_ad
            }
        }
    }
    
    
    func fetchAllCategory() {
        
        ref.child("kategoriler").observe(.value, with: { snapshot in
            if let fetchedData = snapshot.value as? [String: AnyObject] {
                
                self.categories.removeAll()
                
                for row in fetchedData {
                    
                    if let dict = row.value as? NSDictionary {
                        let key = row.key
                        
                        let kategori_ad = dict["kategori_ad"] as? String ?? ""
                        let kategori = Kategoriler(kategori_id: key, kategori_ad: kategori_ad)
                        
                        self.categories.append(kategori)
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categories[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        cell.categoryName.text = category.kategori_ad
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toMovies", sender: indexPath.row)
    }
}

