//
//  HeadlinesTableViewController.swift
//  Headline App IN MVVM
//
//  Created by hosam on 10/31/20.
//

import UIKit

class HeadlinesTableViewController: UITableViewController {
    
    fileprivate let cellId="cellId"
    private var webservice :Services!
    private var sourceListViewModel :SourceListViewModel!
    private var dataSource :HeadlineTableViewDataSource<HeadCell,SourceViewModel>!
    let spinner:UIActivityIndicatorView = {
        let v = UIActivityIndicatorView(style: .large)
        v.color = UIColor.red
        return v
    }()
    var sourceViewModel :SourceViewModel!
    private var headlineListViewModel :HeadlineListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        updateUI()
        setupTable()
    }
    
    func setupTable()  {
        spinner.startAnimating()
        tableView.backgroundView = spinner
        
        self.webservice = Services()
        tableView.register(HeadCell.self, forCellReuseIdentifier: cellId)
        
        self.sourceListViewModel = SourceListViewModel(webservice: self.webservice) {
            self.dataSource = HeadlineTableViewDataSource(cellIdentifier: self.cellId, items: self.sourceListViewModel.sourcesViewModel) { cell, vm in
                cell.source=vm
            }
            
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
            self.spinner.stopAnimating()
        }
    }
    
}

