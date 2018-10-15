//
//  DisplayTableViewExtension.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/15/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        selectedIndex = indexPath.row
//
//        performSegue(withIdentifier: "UpdateVC", sender: self)
//
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
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
            let text = "\(self.filteredData[indexPath.row].nameDescristion ?? "") and \(self.filteredData[indexPath.row].name ?? "") "
            let textShare = [ text ]
            let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
            
        }
        
        delete.backgroundColor = UIColor(red: 0/255, green: 177/255, blue: 106/255, alpha: 1.0)
        share.backgroundColor = UIColor(red: 54/255, green: 215/255, blue: 183/255, alpha: 1.0)
        
        return [delete,share]
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "UpdateVC" {
//            let updateVC = segue.destination as! UpdateItemViewController
//            updateVC.item = filteredData[selectedIndex!]
//        }
//    }
    
}
