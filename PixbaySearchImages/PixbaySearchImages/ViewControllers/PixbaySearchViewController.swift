//
//  ViewController.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 09/01/23.
//

import UIKit

class PixbaySearchViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    var searchImagesArray = [Hit]()
    let viewModel = SearchImagesViewModel()

    @IBOutlet var tableViewSearch: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindSearchListViewModel()
        setUpTableView()
        setUpSearchController()
        viewModel.getUserData()
    }

    func setUpTableView() {
        tableViewSearch.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
    }
    
    func setUpSearchController() {
       searchController.searchResultsUpdater = self
       searchController.hidesNavigationBarDuringPresentation = false
       searchController.dimsBackgroundDuringPresentation = false
       searchController.searchBar.sizeToFit()
       self.tableView.tableHeaderView = searchController.searchBar
    }
}


