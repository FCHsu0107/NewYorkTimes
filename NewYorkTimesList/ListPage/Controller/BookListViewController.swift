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
    
    let presenter: BookListPresenter
    
    private var isLoading: Bool = false
    
    private let threshold: CGFloat = UIScreen.main.bounds.height / 3
    
//    deinit { print("\(self.className) deint") }
    
    init(presenter: BookListPresenter = BookListPresenter()) {
        
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
        isLoading = true
        
        presenter.fetchNextBooks { [weak self] result in
            
            guard let self = self else { return }
            
            self.isLoading = false
            
            switch result.hasBooks {
            
            case true:
                
                self.items = result.bookItems
                
                self.reloadData()
                
            case false:
                
                self.showMessage(result.errorMessage)
            }
        }
    }
    
    var items: [BookItem] = []
    
    private func setUpUI() {
        
        navigationItem.title = "Best Sellers"
        
        view.backgroundColor = .white
        
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
    
    private func reloadData() {
        
        DispatchQueue.main.async { [weak self] in
            
            guard let self = self else { return }
            
            self.tableView.reloadData()
        }
    }
    
    private func showMessage(_ message: String?) {
        // TODO
    }
    
    private func loadMoreData() {
        isLoading = true
        presenter.fetchNextBooks { [weak self] result in
            
            guard let self = self else { return }
            
            self.isLoading = false
            
            switch result.hasBooks {
            
            case true:
                
                let firstIndex = self.items.count
                
                var indexPaths: [IndexPath] = []
                
                self.items += result.bookItems
                
                for i in firstIndex..<self.items.count {
                    
                    indexPaths.append(IndexPath(row: i, section: 0))
                }
                
                self.insertRows(indexPaths: indexPaths)
                
            case false:
                
                self.showMessage(result.errorMessage)
            }
        }
    }
    
    private func insertRows(indexPaths: [IndexPath]) {
        
        DispatchQueue.main.async { [weak self] in
            
            guard let self = self else { return }
            
            self.tableView.performBatchUpdates( { [weak self] in
                
                guard let self = self else { return }
                
                self.tableView.insertRows(at: indexPaths, with: .none)
                
            }, completion: nil)
        }
    }
}

extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(ListBookCell.self, for: indexPath)
        
        cell.config(item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if !isLoading && ((maximumOffset - offsetY) < threshold) {
            
            loadMoreData()
        }
    }
}
