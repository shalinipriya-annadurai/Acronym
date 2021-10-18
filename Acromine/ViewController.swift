//
//  ViewController.swift
//  Acromine
//
//  Created by Shalinipriya Annadurai on 10/13/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var resultSearchController = UISearchController()
    
    var viewModel = AcronymViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Acronyms"
        
        setupTableView()
        setupSearchBar()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AcronymReasult")
        viewModel.bindDataToView = {
            self.tableView.reloadData()
        }
    }

    func setupSearchBar() {
        resultSearchController = {
            
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            tableView.tableHeaderView = controller.searchBar

            return controller
        }()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if resultSearchController.isActive {
            return viewModel.abbreviationList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AcronymReasult", for: indexPath)
        let acronym = viewModel.abbreviationList[indexPath.row]
        cell.textLabel?.text = acronym.lf
        return cell
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text
        if text?.count == 0{
            return
        }
        
        viewModel.getAbbrevation(text!)
        viewModel.bindDataToView = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}




