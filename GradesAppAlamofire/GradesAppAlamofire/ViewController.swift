//
//  ViewController.swift
//  GradesAppAlamofire
//
//  Created by Yusuf Can Bircan on 23.01.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var grades = [Notlar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchAll()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEdit" {
            if let grade = sender as? Notlar {
                
                let vc = segue.destination as! EditViewController
                vc.grade = grade
            }
        }
    }
    
    func fetchAll() {
        
        AF.request("http://kasimadalan.pe.hu/notlar/tum_notlar.php", method: .get).response { response in
            
            if let data = response.data {
                
                do {
                    
                    let json = try JSONDecoder().decode(NotlarCevap.self, from: data)
    
                    if let items = json.notlar {
                        self.grades = items
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func deleteGrade(id:String) {
        
        let params: Parameters = ["not_id": id]
        
        AF.request("http://kasimadalan.pe.hu/notlar/delete_not.php", method: .post, parameters: params).response { response in
           
            if let data = response.data {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print(json)
                    }
                    
                    self.fetchAll()
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "gradeCell", for: indexPath) as! GradesTableViewCell
        cell.courseName.text = grades[indexPath.row].ders_adi
        cell.grade1.text = "\(grades[indexPath.row].not1!)"
        cell.grade2.text = "\(grades[indexPath.row].not2!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "delete", handler: {(contextualAction, view, boolValue) in
            
            let deleteId = self.grades[indexPath.row].not_id
            
            self.deleteGrade(id: deleteId!)
        })
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "edit", handler: {(contextualAction, view, boolValue) in
            self.performSegue(withIdentifier: "toEdit", sender: self.grades[indexPath.row])
        })
        
        return UISwipeActionsConfiguration(actions: [editAction])
    }
}

