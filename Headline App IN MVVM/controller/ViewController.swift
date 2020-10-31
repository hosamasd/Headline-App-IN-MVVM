//
//  ViewController.swift
//  Headline App IN MVVM
//
//  Created by hosam on 10/31/20.
//

import UIKit

class ViewController: UITableViewController {
    
    fileprivate let cellId="cellId"
    private var webservice :Services!
    private var sourceListViewModel :SourceListViewModel!
    private var dataSource :TableViewDataSource<HeadCell,SourceViewModel>!
    let spinner:UIActivityIndicatorView = {
        let v = UIActivityIndicatorView(style: .large)
        v.color = UIColor.red
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTable()
        setupNavigation()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let source = sourceListViewModel.sourcesViewModel[indexPath.item]
        let heade = HeadlinesTableViewController()
        heade.sourceViewModel=source
        navigationController?.pushViewController(heade, animated: true)
    }
    
    func setupNavigation()  {
        navigationItem.title="Headlines"
        navigationController?.navigationBar.prefersLargeTitles=true
    }
    
    func setupTable()  {
        spinner.startAnimating()
        tableView.backgroundView = spinner
        self.webservice = Services()
        tableView.register(HeadCell.self, forCellReuseIdentifier: cellId)
        self.sourceListViewModel = SourceListViewModel(webservice: self.webservice) {
            self.dataSource = TableViewDataSource(cellIdentifier: self.cellId, items: self.sourceListViewModel.sourcesViewModel) { cell, vm in
                cell.source=vm
            }
            
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
            self.spinner.stopAnimating()
        }
    }
    
}

