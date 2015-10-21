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
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var combineField1: UITextField!
    @IBOutlet weak var combineField2: UITextField!
    @IBOutlet weak var combineButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // オブザーブして処理
        textField.bnd_text.observe { (text) in
            print(text)
        }
        
        // テキストフィールドの値をラベルにバインディング
        textField.bnd_text.bindTo(label.bnd_text)
        
        // 値に文字列を追加する
        textField.bnd_text
            .map { "Hi " + $0! }
            .bindTo(label.bnd_text)
        
        button.bnd_tap.observe { (event) in
            print("button tapped.")
        }
        
        // ストリームっぽいやつ
        combineLatest(combineField1.bnd_text, combineField2.bnd_text)
            .map { com1, com2 in
            return com1!.characters.count > 4 && com2!.characters.count > 4
        }.bindTo(combineButton.bnd_enabled)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

