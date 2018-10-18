//
//  ExpenseViewController.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/17/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController {

    @IBOutlet weak var tableViewExpense: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Expense"
        
        self.tableViewExpense.delegate = self
        self.tableViewExpense.dataSource = self
        // Do any additional setup after loading the view.
        
        tableViewExpense.register(UINib(nibName: "ExpenseTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpenseTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ExpenseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableViewExpense.dequeueReusableCell(withIdentifier: "ExpenseTableViewCell", for: indexPath) as! ExpenseTableViewCell


        cell.lblMonthMoney.text = "Hello"
        cell.lblMoney.text = "451241121"
        
        return cell
    }
    
    
}
