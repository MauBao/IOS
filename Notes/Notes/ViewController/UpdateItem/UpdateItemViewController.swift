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
    
//    @IBOutlet weak var textNoteDescription: NSLayoutConstraint!
    @IBOutlet weak var itemEntryNameDescUpdate: UITextField!
    @IBOutlet weak var itemEntryMoneyUpdate: UITextField!
    @IBOutlet weak var itemEntryTextNameUpdate: UITextField!
    @IBAction func updateAction(_ sender: Any) {
        
        guard let newEntryName = itemEntryTextNameUpdate.text,
            let newEntryMoney = itemEntryMoneyUpdate.text,
            let newEntryNameDesc = itemEntryNameDescUpdate.text else  {
                return

        }
        
        let dialogMessage = UIAlertController(title: Constants.titleShowAlertMessage, message: Constants.messageChangeUpdate, preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: Constants.okButtonAlert, style: .default, handler: { (action) -> Void in
            //Save
            self.item.name = newEntryName
            self.item.money = newEntryMoney
            self.item.nameDescristion = newEntryNameDesc
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.navigationController?.popViewController(animated: true)
        })
        
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: Constants.cancelButtonAlert, style: .cancel) { (action) -> Void in
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.titleViewUpdateItem
        
        itemEntryTextNameUpdate.text = item?.name
        itemEntryMoneyUpdate.text = item?.money
        itemEntryNameDescUpdate.text = item?.nameDescristion

        // Do any additional setup after loading the view.
        hideKeyboardWhenTapped()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }

//    // hieu ung di chuyen texfield khi hien bp
//    @objc func keyboardWillShow(notification: NSNotification) {
//
//        if let info = notification.userInfo {
//            let rect:CGRect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
//
//            self.view.layoutIfNeeded()
//            UIView.animate(withDuration: 0.25, animations: {
//
//                self.view.layoutIfNeeded()
//                self.textNoteDescription.constraints = rect.height + 20
//                })
//        }
//    }
    
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
