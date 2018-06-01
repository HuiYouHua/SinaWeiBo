//
//  WBHomeViewController.swift
//  新浪微博
//
//  Created by 华惠友 on 2017/9/17.
//  Copyright © 2017年 华惠友. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaeViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func showFriends() {
        let vc = WBDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension WBHomeViewController {
    /// 重写父类的方法
    override func setupUI() {
        super.setupUI()
        
        // 设置导航栏标题
        // 无法高亮
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showFriends))
        
        // Swift 调用 OC 返回 instancetype 的方法, 判断不出是否可选
//        let btn: UIButton = UIButton.cz_textButton("好友", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
//        btn.addTarget(self, action: #selector(showFriends), for: .touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize: 16,  target: self, action: #selector(showFriends))
    }
}









