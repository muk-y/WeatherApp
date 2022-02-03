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
        setupView()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.backgroundColor = .clear
        tableView?.contentInset = UIEdgeInsets(top: 8, left: .zero, bottom: 8, right: .zero)
    }
    
    private func setupView() {
        view.backgroundColor = .black
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

// MARK: UITableViewDataSource
extension WeatherListViewController: UITableViewDelegate {
    
    
    
}
