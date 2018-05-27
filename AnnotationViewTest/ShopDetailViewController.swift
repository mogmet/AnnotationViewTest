//
//  ShopDetailViewController.swift
//  AnnotationViewTest
//
//  Created by mogmet on 2018/05/27.
//  Copyright © 2018年 mogmet. All rights reserved.
//

import UIKit
class ShopDetailViewController: UIViewController {
    @IBOutlet weak var shopLabel: UILabel!
    var shop: Shop?
    override func viewDidLoad() {
        shopLabel.text = shop?.shopName
    }
}
