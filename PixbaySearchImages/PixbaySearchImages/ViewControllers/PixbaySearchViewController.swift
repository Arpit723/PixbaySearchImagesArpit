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
    // MARK: - Component
    lazy var indicatorView: UIActivityIndicatorView = {
      let view = UIActivityIndicatorView(style: .large)
      view.color = .black
      view.startAnimating()
       view.hidesWhenStopped = true
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()


    @IBOutlet var tableViewSearch: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
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
    
    func setUpUI() {
        tableView.addSubview(indicatorView)
        let xConstraint = NSLayoutConstraint(item: indicatorView, attribute: .centerX, relatedBy: .equal, toItem: tableView, attribute: .centerX, multiplier: 1, constant: 0)

        let yConstraint = NSLayoutConstraint(item: indicatorView, attribute: .centerY, relatedBy: .equal, toItem: tableView, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([xConstraint, yConstraint])
    }
}


