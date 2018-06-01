//
//  WBBaeViewController.swift
//  新浪微博
//
//  Created by 华惠友 on 2017/9/17.
//  Copyright © 2017年 华惠友. All rights reserved.
//

import UIKit

class WBBaeViewController: UIViewController {

    // 自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    // 自定义的导航条目 -- 以后设置导航栏内容, 同意使用 navItem
    lazy var navItem = UINavigationItem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    // 重写 title 的 didSet
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
}

extension WBBaeViewController {
    func setupUI() {
        self.view.backgroundColor = UIColor.cz_random()
        
        // 添加导航条
        view.addSubview(navigationBar)
        // 将 item设置给 bar
        navigationBar.items = [navItem]
        
        // 设置 navBar 的渲染颜色
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
    
        // 设置 navBar 的字体颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
    }
}
