//
//  SeachViewController.swift
//  CryptoConverterApp
//
//  Created by Владимир Файб on 16.11.2019.
//  Copyright © 2019 Другов Родион. All rights reserved.
//

import UIKit

class SeachViewController: UITableViewController {
  
  private var timer: Timer?
  
  let searchController = UISearchController(searchResultsController: nil)
  var networkService = NetworkServices()
  var quotes = [Quote]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    setupSearchBar()
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    networkService.fetch { [weak self](quotes) in
      self?.quotes = quotes ?? []
      self?.tableView.reloadData()
    }
    

  }
  
  private func setupSearchBar() {
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    searchController.searchBar.delegate = self
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return quotes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
    let quote = quotes[indexPath.row]
    let convert = Converter(baseQuote: quotes[0])
    cell.textLabel?.text = "\(quote.rankInt!). \(quote.name) $\(quote.usdPrice)\n\(Quote.quoteString(convert.exchanger(amount: 1, convertQuote: quote)))"
    cell.textLabel?.numberOfLines = 2
    cell.imageView?.image = UIImage(named: quote.id.lowercased()) ?? UIImage(named: "0chain")
    return cell
  }
}

extension SeachViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    timer?.invalidate()
    
    timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
      
    })
  }
}

