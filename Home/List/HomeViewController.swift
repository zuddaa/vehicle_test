//
//  HomeViewController.swift
//  Home
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
  
//  // Create an observable list of items
//  var items: [MyItem] = [] {
//      didSet {
//          tableView.reloadData()
//      }
//  }
  var viewModel = HomeViewModel()
  // Create a table view
  let tableView = UITableView()
  
  // Create a pagination indicator view
  let activityIndicatorView = UIActivityIndicatorView(style: .large)
  
  override func viewDidLoad() {
      super.viewDidLoad()
      
      // Add the table view and pagination indicator view to the view hierarchy
      view.addSubview(tableView)
      view.addSubview(activityIndicatorView)
      
      // Set up the table view
      tableView.dataSource = self
      tableView.delegate = self
      tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
      tableView.rowHeight = UITableView.automaticDimension
      tableView.estimatedRowHeight = 100
      tableView.tableFooterView = UIView()
      
      // Set up the pagination indicator view
      activityIndicatorView.hidesWhenStopped = true
      
      // Fetch the initial page of items
      viewModel.fetchItems()
  }
  
  override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      
      // Set the frame of the table view and pagination indicator view
      tableView.snp.makeConstraints { make in
          make.edges.equalToSuperview()
      }
      
      activityIndicatorView.snp.makeConstraints { make in
          make.centerX.equalToSuperview()
          make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
      }
  }
}
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        // Configure the cell with the item at the current index path
        let item = items[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // If the user has scrolled to the bottom of the table view, fetch the next page of items
        let lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
        if indexPath.row == lastRowIndex {
            fetchItems()
        }
    }
    
}
