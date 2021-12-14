//
//  AddItemViewController.swift
//  Bucket List crUD
//
//  Created by R on 10/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

protocol ItemDelegate {
    func saveItem(item:String,at:Int?)
}

class AddItemViewController: UIViewController {

    var delegate:ItemDelegate?
    var newitem:String?
    var index:Int?

    

    @IBOutlet weak var newItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
           newItem.text = newitem
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        if index == nil{
        if let newitem1 = newItem.text{
            delegate?.saveItem(item: newitem1, at:nil)
            print(newitem1)
            navigationController?.popViewController(animated: true)
        }
        }else{
            if let newitem1 = newItem.text{
                delegate?.saveItem(item: newitem1, at:index)
                print(newitem1)
                navigationController?.popViewController(animated: true)

            }
        }
    }
    
  

}
