//
//  UpdateItemViewController.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/15/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

class UpdateItemViewController: UIViewController, UITextViewDelegate {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var item: Item!
    
    @IBOutlet weak var entryTextNote: UITextView!
    @IBAction func dismiss(_ sender: Any) {
    }
    
    @IBAction func updateAction(_ sender: Any) {
        guard let newEntry = entryTextNote.text else  {
            return
        }
        
        item.nameDescristion = newEntry
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        entryTextNote!.delegate = self
        entryTextNote!.becomeFirstResponder()
        configureEntryData(entry: item)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureEntryData(entry: Item) {
        
        guard let text = entry.name else {
            return
        }
        
        entryTextNote!.text = text
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
}
