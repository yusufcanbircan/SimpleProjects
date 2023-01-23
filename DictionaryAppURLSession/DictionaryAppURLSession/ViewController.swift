//
//  ViewController.swift
//  DictionaryAppURLSession
//
//  Created by Yusuf Can Bircan on 23.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var words = [Kelimeler]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        fetchAllData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexRow = sender as? Int
        
        if segue.identifier == "toResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.words = words[indexRow!]
        }
    }
    
    func fetchAllData() {
        let url = URL(string: "http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php")!
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error != nil || data == nil {
                print("eroorr")
                return
            }
            
            do {
                
                let json = try JSONDecoder().decode(KelimelerResult.self, from: data!)
                
                if let result = json.kelimeler {
                    self.words = result
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print(error.localizedDescription)
            }
            
            
        }).resume()
    }
    
    func searchData(searchText:String) {
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/sozluk/kelime_ara.php")!)
        request.httpMethod = "POST"
        
        let postString = "ingilizce=\(searchText)"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            
            if error != nil || data == nil {
                return
            }
            
            do {
                
                let json = try JSONDecoder().decode(KelimelerResult.self, from: data!)
                if let searchedWords = json.kelimeler {
                    self.words = searchedWords
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print(error.localizedDescription)
            }
            
        }).resume()
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let word = words[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath) as! WordsTableViewCell
        
        cell.label.text = word.ingilizce
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toResult", sender: indexPath.row)
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchData(searchText: searchText)
    }
    
}

