//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//
//

import UIKit

class WeatherListViewController: UIViewController {
    
    // MARK: Properties
    var presenter: WeatherListModuleInterface?
    private var viewModels: [WeatherListViewModel]? {
        didSet {
            tableView?.reloadData()
        }
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView?
    
    // MARK: VC's Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewIsReady()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView?.dataSource = self
    }
    
}

// MARK: WeatherListViewInterface
extension WeatherListViewController: WeatherListViewInterface {
    
    func show(_ models: [WeatherListViewModel]) {
        viewModels = models
    }
    
}

// MARK: UITableViewDataSource
extension WeatherListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WeatherListTableViewCell = tableView.dequeue(cellForRowAt: indexPath)
        cell.viewModel = viewModels?[indexPath.row]
        return cell
    }
    
}
