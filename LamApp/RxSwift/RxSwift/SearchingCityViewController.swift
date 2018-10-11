//
//  SearchingCityViewController.swift
//  RxSwift
//
//  Created by Bao Ngo Mau on 10/11/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

class SearchingCityViewController: UITableViewController {

    var shownCities = [String]() // Data source for UITableView
    let allCities = ["Oklahoma", "Chicago", "Moscow", "Danang", "Vancouver", "Praga"] // Mocked API data source
    
 
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var hfgh: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return shownCities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hfgh.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        cell.textLabel?.text = shownCities[indexPath.row]
        
        return cell
    }
}

