//
//  ExpenseViewController.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/17/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController {

    var delegate: ExpenseTableViewProtocol?
    
    var moneyExpense: [Item] = []
    
    @IBOutlet weak var tableViewExpense: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Expense"
        
        self.tableViewExpense.delegate = self
        self.tableViewExpense.dataSource = self
        // Do any additional setup after loading the view.
        
        tableViewExpense.register(UINib(nibName: "ExpenseTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpenseTableViewCell")
        getSingle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // lay date
//    func getCurrenDateTime() {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "EEEE , MM,dd,yyyy HH:mm a"
//        let str = formatter.string(from: Date())
//
//    }
    // tra date
    func getSingle() {
        let date = Date()
        let calender = Calendar.current
        let year = calender.component(.year, from: date)
        let month = calender.component(.month, from: date)
        let day = calender.component(.day, from: date)
        
        print("\(year):\(month):\(day)")
        
    }
}

extension ExpenseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableViewExpense.dequeueReusableCell(withIdentifier: "ExpenseTableViewCell", for: indexPath) as! ExpenseTableViewCell
        
        
        cell.lblMoney.text = String(calorieTotal)
        cell.lblMonthMoney.text = "451241121"
        
        return cell
    }
    
    
}
