//
//  DisplayTableViewExtension.swift
//  Notes
//
//  Created by Bao Ngo Mau on 10/15/18.
//  Copyright © 2018 Bao Ngo Mau. All rights reserved.
//

import UIKit

extension DisplayTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let updateItemView = UpdateItemViewController()
        updateItemView.commonInit(filteredData[indexPath.row].name!, textMoney: filteredData[indexPath.row].money! , textNameDesc: filteredData[indexPath.row].nameDescristion!)
        
        selectedIndex = indexPath.row
        updateItemView.item = filteredData[selectedIndex!]
        
        self.navigationController?.pushViewController(updateItemView, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CustomNoteTableViewCell, for: indexPath) as? CustomNoteTableViewCell
        
        let date = filteredData[indexPath.row].date
        let time = filteredData[indexPath.row].time
        
        // reversed() dat bai moi them len top
        //        cell?.lblNotes.text = "Note: " + filteredData.reversed()[indexPath.row].nameDescristion!

        cell?.lblNotes.text = Constants.lblNote + filteredData[indexPath.row].nameDescristion!
        cell?.lblNameNote.text = Constants.lblNameNote +  filteredData[indexPath.row].name!
        cell?.lblMoneyNote.text = Constants.lblMoneyNote + filteredData[indexPath.row].money!
        if let date = date, let time = time {
            let timeStamp = "Added on \(date) at \(time)"
            cell?.lblDateCreateNote.text = timeStamp
        }
        
        return cell!
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: Constants.itemDelete) { (action, indexPath) in
            // delete item at indexPath
            let item = self.filteredData[indexPath.row]
            self.context.delete(item)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            self.filteredData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        let share = UITableViewRowAction(style: .default, title: Constants.itemShare) { (action, indexPath) in
            // share item at indexPath
            let name = "\(self.filteredData[indexPath.row].name ?? Constants.nill) "
            let nameDescristion = "\(self.filteredData[indexPath.row].nameDescristion ?? Constants.nill) "
            let money = "\(self.filteredData[indexPath.row].money ?? Constants.nill) "
            let textShare = [name, money, nameDescristion]
            let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        }
        
        delete.backgroundColor = UIColor(red: 0/255, green: 177/255, blue: 106/255, alpha: 1.0)
        share.backgroundColor = UIColor(red: 54/255, green: 215/255, blue: 183/255, alpha: 1.0)
        
        return [delete,share]
    }
}
