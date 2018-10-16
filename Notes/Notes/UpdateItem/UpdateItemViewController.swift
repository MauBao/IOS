//
//  UpdateItemViewController.swift
//  
//
//  Created by Bao Ngo Mau on 10/15/18.
//

import UIKit

class UpdateItemViewController: UIViewController, UITextViewDelegate {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var item: Item!
    var updateViewController: UpdateItemViewController?
    
    @IBOutlet weak var itemEntryNameDescUpdate: UITextField!
    @IBOutlet weak var itemEntryMoneyUpdate: UITextField!
    @IBOutlet weak var itemEntryTextNameUpdate: UITextField!
    @IBAction func updateAction(_ sender: Any) {
        
        guard let newEntry = itemEntryTextNameUpdate.text else  {
            return
        }
        
        item.name = newEntry
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    self.updateViewController?.navigationController?.popViewController(animated: true)
//        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Update"
        
        itemEntryTextNameUpdate.text = item?.name
        itemEntryMoneyUpdate.text = item?.money
        itemEntryNameDescUpdate.text = item?.nameDescristion

        // Do any additional setup after loading the view.
        hideKeyboardWhenTapped()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func commonInit(_ textName: String, textMoney: String, textNameDesc: String) {
        self.itemEntryTextNameUpdate?.text = textName
        self.itemEntryMoneyUpdate?.text = textMoney
        self.itemEntryNameDescUpdate?.text = textNameDesc
    }
    
    func configureEntryData(entry: Item) {
        
        guard let text = entry.name else {
            return
        }
        
        itemEntryNameDescUpdate!.text = text
    }
}
