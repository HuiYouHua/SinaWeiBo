//
//  WBDemoViewController.swift
//  新浪微博
//
//  Created by 华惠友 on 2017/9/17.
//  Copyright © 2017年 华惠友. All rights reserved.
//

import UIKit

class WBDemoViewController: WBBaeViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "第\(navigationController?.viewControllers.count ?? 0)个"
    }
    
    func showNext() {
        let vc = WBDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension WBDemoViewController {
    override func setupUI() {
        super.setupUI()
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", fontSize: 16, target: self, action: #selector(showNext))
    }
}
