//
//  WBNavgationController.swift
//  新浪微博
//
//  Created by 华惠友 on 2017/9/17.
//  Copyright © 2017年 华惠友. All rights reserved.
//

import UIKit

class WBNavgationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 隐藏默认的 NavigationBar
        navigationBar.isHidden = true
    }

    /// 重写 push 方法, 所有的 push 动作都会调用此方法!
    // viewController 是被 push 的控制器, 设置它的左侧的按钮作为返回按钮
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        // 如果不是栈底控制器才需要隐藏, 根控制器不需要处理
        if childViewControllers.count > 0 {
            // 隐藏底部的 Tabbar
            viewController.hidesBottomBarWhenPushed = true
            
            // 判断控制器的类型
            if let vc = viewController as? WBBaeViewController {
                
                var title = "返回"
                
                // 判断控制器的级数 只有一个子控制器的时候, 显示栈底控制器的标题
                if childViewControllers.count == 1 {
                    // title 显示首页的标题
                    title = childViewControllers.first?.title ?? title
                }
                
                // 取出自定义的 navItem, 设置左侧按钮作为返回按钮
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, fontSize: 16, target: self, action: #selector(popToParent), isBack: true)
            }
        }
        
        
        super.pushViewController(viewController, animated: true)
        
        
    }
    
    // POP 返回到上一级
    @objc private func popToParent() {
        popViewController(animated: true)
    }
    
}
