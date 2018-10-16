//
//  DisplayTableViewController.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/12/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class DisplayTableViewController: UIViewController, UISearchBarDelegate {
    
    var presenter: NoteCellProtocol?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items: [Item] = []
    var selectedIndex: Int!
    var filteredData: [Item] = []
    
//    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.register(UINib.init(nibName: "CustomNoteTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomNoteTableViewCell")
        createSearchBar()
        //an bphim
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
        // xoa dong gạch duoi tableView trong
        self.tableView.tableFooterView = UIView()
    }
    
    // khi call sẽ grap dlieu
    func fetchData() {
        
        do {
            items = try context.fetch(Item.fetchRequest())
            // fix thư tu mang reversed()
            filteredData = items.reversed()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Couldn't Fetch Data")
        }
    }
}
