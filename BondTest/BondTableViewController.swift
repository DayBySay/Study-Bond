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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataSource = ObservableArray(
            [
                ObservableArray(
                    [
                        "テキスト1",
                        "テキスト2",
                        "テキスト3",
                        "テキスト4",
                    ]
                )
            ]
        )
        dataSource.bindTo(self.tableView) { indexPath, dataSource, tableView in
            let cell = tableView.dequeueReusableCellWithIdentifier("reuseCell", forIndexPath: indexPath)
            let name = dataSource[indexPath.section][indexPath.row]
            cell.textLabel!.text = name
            
            return cell
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
