//
//  MainViewController.swift
//  MovieMVVM
//
//  Created by Yusuf Can Bircan on 29.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //IBOutlets:
    @IBOutlet var tableView: UITableView!
    
    //ViewModel
    var viewModel: MainViewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    func configView() {
        self.title = "Main View"
        
        setupTableView()
    }
}
