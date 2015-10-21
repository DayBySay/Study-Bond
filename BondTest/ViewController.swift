//
//  ViewController.swift
//  BondTest
//
//  Created by 清 貴幸 on 2015/10/21.
//  Copyright © 2015年 DayBySay. All rights reserved.
//

import UIKit
import Bond

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // テキストのバインディング
        textField.bnd_text.bindTo(label.bnd_text)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

