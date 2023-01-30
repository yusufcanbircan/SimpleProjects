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
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    //ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    // Variables
    var cellDataSource: [MovieTableCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func configView() {
        self.title = "Popular Movies"
        
        setupTableView()
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    
}
