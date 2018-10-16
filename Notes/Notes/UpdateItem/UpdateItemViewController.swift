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
        
        guard let newEntryName = itemEntryTextNameUpdate.text,
            let newEntryMoney = itemEntryMoneyUpdate.text,
            let newEntryNameDesc = itemEntryNameDescUpdate.text else  {
                return
        }
        
        item.name = newEntryName
        item.money = newEntryMoney
        item.nameDescristion = newEntryNameDesc
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
//        if ((itemEntryNameDescUpdate?.text!.isEmpty)! || (itemEntryMoneyUpdate?.text!.isEmpty)! || (itemEntryTextNameUpdate?.text!.isEmpty)!) {
//            let alert = UIAlertController(title: "Please Type Something", message: "Your entry was left blank.", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Okay", style: .default) { action in
//
//            })
//            self.present(self, animated: true, completion: nil)
//        }
//        else {
//            dismiss(animated: true, completion: nil)
//        }
        
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
