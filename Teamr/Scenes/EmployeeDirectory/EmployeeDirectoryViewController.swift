//
//  ViewController.swift
//  Teamr
//
//  Created by Amir on 2023-09-11.
//

import UIKit
import TeamrKit

class EmployeeDirectoryViewController: UITableViewController, DependencyInjectorType { /// Can only inject if class conforms.
    
    // Dependency Injection
    /// If we had more repositories, it will go through every injectRepo() until construction of appropriate one (Chain of command)...
    private lazy var interactor: EmployeeDirectoryBusinessLogic = EmployeeDirectoryInteractor(
        employeeRepository: dependencies.injectRepository(),
        presenter: EmployeeDirectoryPresenter(viewController: self)
    )
    
    // Router for navigation in app, not necessary, but part of the VIPER cycle so...
    private lazy var router: EmployeeDirectoryRoutable = EmployeeDirectoryRouter(
        viewController: self
    )
    
    private var model: [EmployeeDirectoryModels.EmployeeModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.fetch()
        self.setupTableView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return model != nil ? 1 : 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = model else {
            return 0
        }
        
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = model else {
            return UITableViewCell()
        }
        
        let item = model[indexPath.row] // data block
        let cell: EmployeeDirectoryTableViewCell = tableView[indexPath] // custom subscript for ease.
        
        cell.bind(with: item) // typical bind
        
        return cell
    }
}

// MARK: - VIP Cycle

extension EmployeeDirectoryViewController: EmployeeDirectoryDisplayable {
    
    func display(with model: [EmployeeDirectoryModels.EmployeeModel]) {
        self.model = model
        
        tableView.refreshControl?.endRefreshing()
        tableView.restore() // custom function to update UI
        tableView.reloadData()
        
        if model.isEmpty {
            tableView.setEmptyView(title: "No Data!", message: "") // custom function to update UI
        }
    }
    
    func display(errorTitle: String, errorMessage: String) {
        self.model = nil
        
        tableView.refreshControl?.endRefreshing()
        tableView.restore() // custom function to update UI
        tableView.reloadData()
        
        tableView.setEmptyView(title: errorTitle, message: errorMessage) // custom function to update UI
    }
}

// MARK: - Helpers

private extension EmployeeDirectoryViewController {
    
    @objc func refresh() {
        interactor.fetch()
    }
    
    func setupTableView() {
        tableView.backgroundColor = .white
        
        tableView.register(nib: EmployeeDirectoryTableViewCell.self) /// custom function to register cells without the chunky bits
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
}
