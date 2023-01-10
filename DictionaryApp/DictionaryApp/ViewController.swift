//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Yusuf Can Bircan on 28.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    var words = [Word]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //// Copying Database
        copyDatabase()
        
        words.append(Word(kelime_id: 1, ingilizce: "door", turkce: "kapi"))
        words.append(Word(kelime_id: 2, ingilizce: "apple", turkce: "elma"))
        words.append(Word(kelime_id: 3, ingilizce: "floor", turkce: "kat"))
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func copyDatabase() {
        
        let bundlePath = Bundle.main.path(forResource: "sozluk", ofType: ".sqlite")
        
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let copyDestination = URL(fileURLWithPath: destinationPath).appending(path: "sozluk.sqlite")
        
        if !FileManager.default.fileExists(atPath: copyDestination.path()) {
            do {
                try FileManager.default.copyItem(atPath: bundlePath! , toPath: copyDestination.path())
            } catch {
                print(error.localizedDescription)
            }
        }
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
        
        cell.wordLabel.text = word.ingilizce
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toResultViewController", sender: indexPath.row)
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("\(searchText)")
    }
    
}

