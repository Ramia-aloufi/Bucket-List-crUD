//
//  ViewController.swift
//  Bucket List crUD
//
//  Created by R on 09/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class BuckitListVC: UITableViewController,ItemDelegate {


    
    var items = ["Sky diving", "Live in Hawaii"]
    
    func saveItem(item: String ,at:Int?) {
        print("saveItemfunc")
        if at == nil{
        items.append(item)
        }else{
            items[at!] = item
        }
        tableView.reloadData()
        print(items)
    }
    
    @IBAction func goToSecondView(_ sender: UIBarButtonItem) {
        let secondVC = storyboard?.instantiateViewController(identifier: "secondVC") as! AddItemViewController
        secondVC.delegate  = self
        navigationController?.pushViewController(secondVC, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let secondVC = storyboard?.instantiateViewController(identifier: "secondVC") as! AddItemViewController
        secondVC.delegate  = self
        secondVC.newitem = items[indexPath.row]
        secondVC.index = indexPath.row
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "delete") { (action, view, clousour) in
            self.items.remove(at: indexPath.row)
            tableView.reloadData()
        }
        let swipconf = UISwipeActionsConfiguration(actions: [delete])
        return swipconf
    }



}

