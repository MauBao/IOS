//
//  DisplaySearchExtension.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/15/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

extension DisplayTableViewController {
    
    // MARK: CreateSearchBar()
    func createSearchBar() {
        
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
    }
    
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //search name
        if searchText.isEmpty {
            filteredData = items
        } else {
            filteredData = items.filter {
                ($0.name?.lowercased().contains(searchText.lowercased()))! ||
                ($0.nameDescristion?.lowercased().contains(searchText.lowercased()))! || ($0.money?.lowercased().contains(searchText.lowercased()))!
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

