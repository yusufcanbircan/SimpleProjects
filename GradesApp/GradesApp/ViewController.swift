//
//  ViewController.swift
//  GradesApp
//
//  Created by Yusuf Can Bircan on 17.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var grades = [Grades]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        copyDatabase()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        grades = GradesDao().fetchAllData()
        
        var toplam = 0.0
        
        for i in grades {
            toplam += ((i.grade1! + i.grade2!) / 2.0)
        }
        
        if grades.count != 0 {
            navigationItem.prompt = "Average: \(toplam/Double(grades.count))"
        } else {
            navigationItem.prompt = "Average: NoN"
        }
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEdit" {
            if let grade = sender as? Grades {
                
                let vc = segue.destination as! EditViewController
                vc.grade = grade
            }
        }
    }
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "Grades", ofType: ".sqlite")
        
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let copyDestination = URL(fileURLWithPath: destinationPath).appending(path: "Grades.sqlite")
        
        if !FileManager.default.fileExists(atPath: copyDestination.path()) {
            do {
                
                try FileManager.default.copyItem(atPath: bundlePath!, toPath: copyDestination.path())
                
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
        return grades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "gradesCell", for: indexPath) as! GradesCellTableViewCell
        cell.gradeName.text = grades[indexPath.row].name
        cell.grade1.text = "\(grades[indexPath.row].grade1!)"
        cell.grade2.text = "\(grades[indexPath.row].grade2!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "delete", handler: {(contextualAction, view, boolValue) in
            
            let deleteId = self.grades[indexPath.row].id
            GradesDao().deleteData(id: deleteId!)
            
            self.grades = GradesDao().fetchAllData()
            self.tableView.reloadData()
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
