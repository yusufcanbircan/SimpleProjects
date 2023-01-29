//
//  MainViewController+TableView.swift
//  MovieMVVM
//
//  Created by Yusuf Can Bircan on 29.01.2023.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = .clear
        self.registerCells()
    }
    
    func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "movieCell")
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movieData = self.cellDataSource[indexPath.row]
        cell.textLabel?.text = self.viewModel.getMovieTitle(movieData)
        
        return cell
    }
}
