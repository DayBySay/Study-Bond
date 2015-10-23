//
//  Article.swift
//  BondTest
//
//  Created by 清 貴幸 on 2015/10/21.
//  Copyright © 2015年 DayBySay. All rights reserved.
//

import Foundation
import Bond

struct Article {
    var title: Observable<String?>
    let all: [Article] = [
            Article(title: Observable("タイトル1")),
            Article(title: Observable("タイトル2")),
            Article(title: Observable("タイトル3")),
            Article(title: Observable("タイトル4")),
            Article(title: Observable("タイトル5")),
        ]
}