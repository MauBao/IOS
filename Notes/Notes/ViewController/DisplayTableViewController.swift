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
    
    // notification clock
    var noteNotification = [NoteNotificationsClock]()
    let dateFormatter = DateFormatter()
    let locale = NSLocale.current
    
    var menuNote = false
    
//    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var leadingConstrantSide: NSLayoutConstraint!
    @IBOutlet weak var leadingContrantTableViewNote: NSLayoutConstraint!
    
    @IBAction func expenseNote(_ sender: Any) {
        let expenseNote = ExpenseViewController()
        
        self.navigationController?.pushViewController(expenseNote, animated: true)
    }
    
    @IBAction func changePass(_ sender: Any) {
        let changePass = ChangePassViewController()
        
        self.navigationController?.pushViewController(changePass, animated: true)
    }
    
    @IBAction func settingNote(_ sender: Any) {
        let settingNote = SettingsNoteViewController()
        
        self.navigationController?.pushViewController(settingNote, animated: true)
    }
    
    @IBAction func logoutNote(_ sender: Any) {
        
    }
    
    @IBAction func itemMenuNote(_ sender: Any) {
        if (menuNote) {
            leadingConstrantSide.constant = -150
            leadingContrantTableViewNote.constant = 0
        } else {
            leadingConstrantSide.constant = 0
            leadingContrantTableViewNote.constant = 150
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        }
        menuNote = !menuNote
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //constraint
        leadingContrantTableViewNote.constant = 0
        
        tableView.register(UINib.init(nibName: Constants.CustomNoteTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.CustomNoteTableViewCell)
        
        // set more dateFormatter settings
        dateFormatter.locale = locale
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        // search bar
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
                
//                var calorieTotal: Int {
//                    return items.money.reduce(0) { $0 + $1 }
//                }
                
            }
        } catch {
            Utility.showAlert(message: Constants.grapDataFail, context: self)
        }
    }
}
