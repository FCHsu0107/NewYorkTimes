//
//  BookListViewController.swift
//  NewYorkTimesList
//
//  Created by Fu-Chiung HSU on 2021/9/14.
//

import UIKit

class BookListViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        
        initTableView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    
    private func setUpUI() {
        
        view.backgroundColor = .yellow
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func initTableView() -> UITableView {
        
        let tableView = UITableView()
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        
        tableView.allowsSelection = false
        
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.estimatedRowHeight = 60
        
        tableView.register(cellType: ListBookCell.self)
        
        return tableView
    }
}

extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(ListBookCell.self, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
}
