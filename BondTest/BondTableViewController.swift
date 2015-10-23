//
//  BondTableViewController.swift
//  BondTest
//
//  Created by 清 貴幸 on 2015/10/23.
//  Copyright © 2015年 DayBySay. All rights reserved.
//

import UIKit
import Bond

class BondTableViewController: UITableViewController {
    var dataSource = ObservableArray(
            [
                ObservableArray(
                    [
                        Observable(Optional("テキスト1")),
                    ]
                )
            ]
        )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.bindTo(self.tableView) { indexPath, dataSource, tableView in
            let cell: ReuseCell = tableView.dequeueReusableCellWithIdentifier("reuseCell", forIndexPath: indexPath) as! ReuseCell
            let name = dataSource[indexPath.section][indexPath.row]
            cell.textLabel!.text = name.value
            
            // わかりづらいけどViewModelと双方向バインディングしている
            cell.textLabel!.bnd_text ->>< name
            cell.textField.bnd_text ->>< name
            return cell
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add() {
        let name = "テキスト" + String(dataSource[0].count + 1)
        dataSource[0].append(Observable(name))
    }
    
    @IBAction func remove() {
        dataSource[0].removeLast()
    }
}

class ReuseCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
}