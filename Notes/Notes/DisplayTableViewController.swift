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
        //        self.tableView.tableFooterView = UIView()
    }
    
    // khi call sẽ grap dlieu
    func fetchData() {
        
        do {
            items = try context.fetch(Item.fetchRequest())
            filteredData = items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Couldn't Fetch Data")
        }
    }
}

extension DisplayTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomNoteTableViewCell", for: indexPath) as? CustomNoteTableViewCell
        
        let date = filteredData.reversed()[indexPath.row].date
        let time = filteredData.reversed()[indexPath.row].time
        
        cell?.lblNotes.text = filteredData.reversed()[indexPath.row].nameDescristion
        cell?.lblNameNote.text = filteredData.reversed()[indexPath.row].name
        cell?.lblMoneyNote.text = filteredData.reversed()[indexPath.row].money
        if let date = date, let time = time {
            let timeStamp = "Added on \(date) at \(time)"
            cell?.lblDateCreateNote.text = timeStamp
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        
        performSegue(withIdentifier: "UpdateVC", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            let item = self.filteredData[indexPath.row]
            self.context.delete(item)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            self.filteredData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            // share item at indexPath
            print("Share")
            
        }
        delete.backgroundColor = UIColor(red: 0/255, green: 177/255, blue: 106/255, alpha: 1.0)
        share.backgroundColor = UIColor(red: 54/255, green: 215/255, blue: 183/255, alpha: 1.0)
        
        return [delete,share]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UpdateVC" {
            let updateVC = segue.destination as! UpdateItemViewController
            updateVC.item = filteredData[selectedIndex!]
        }
    }
    
}
// an bp
extension DisplayTableViewController {
    
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
                ($0.name?.lowercased().contains(searchText.lowercased()))!
            }
        }
        //search name Description
        if searchText.isEmpty {
            filteredData = items
        } else {
            filteredData = items.filter {
                ($0.nameDescristion?.lowercased().contains(searchText.lowercased()))!
            }
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
