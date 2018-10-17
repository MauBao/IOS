//
//  DisplaySearchExtension.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/15/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

extension DisplayTableViewController {
    
    // MARK: Hide keyboard
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DisplayTableViewController.dismissKeyboard(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        
        if let nav = self.navigationController {
            nav.view.endEditing(true)
        }
    }
    
    // MARK: CreateSearchBar()
    func createSearchBar() {
        
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = Constants.planceSearch
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

