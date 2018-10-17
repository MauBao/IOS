//
//  NotesViewController.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/12/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var itemEntryTextView: UITextField!
    @IBOutlet weak var itemEntryMoney: UITextField!
    @IBOutlet weak var itemEntryName: UITextField!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveItem(_ sender: Any) {
        if ((itemEntryTextView?.text!.isEmpty)! || (itemEntryMoney?.text!.isEmpty)! || (itemEntryName?.text!.isEmpty)!) || itemEntryTextView?.text == Constants.planceitemEntryTextView {
         
            let alert = UIAlertController(title: Constants.titleMessageAddEmty, message: Constants.messageAddEmty, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Constants.okayMessageAddEmty, style: .default) { action in
                
            })
            
            self.present(alert, animated: true, completion: nil)
        } else {
            // lay ngay thang
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = Constants.dateFormatAdd
            let currentDate = formatter.string(from: date)
            
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = .short
            let currentTime = timeFormatter.string(from: date)
            
            guard let entryText = itemEntryTextView?.text else {
                return
            }
            guard let entryMoney = itemEntryMoney?.text else {
                return
            }
            guard let entryName = itemEntryName?.text else {
                return
            }
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let newEntry = Item(context: context)
            newEntry.nameDescristion = entryText
            newEntry.name = entryName
            newEntry.money = entryMoney
            newEntry.date = currentDate
            newEntry.time = currentTime
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//      self.title = "New Notes"
        // hide keyboard textFiled
        self.hideKeyboardWhenTapped()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

