//
//  UIBarButtonItem+Extension.swift
//  新浪微博
//
//  Created by 华惠友 on 2017/9/17.
//  Copyright © 2017年 华惠友. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    
    /// 创建 UIBarButtonItem
    ///
    /// - Parameters:
    ///   - title: title
    ///   - fontSize: fontSize, 默认16号
    ///   - target: target
    ///   - action: action
    ///   - isBack: 是否是返回按钮, 是加上箭头
    convenience init(title: String, fontSize: CGFloat = 16, target: AnyObject?, action: Selector, isBack: Bool = false) {
        
        let btn: UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        
        if isBack {
            let imageName = "navigationbar_back_withtext"
            btn.setImage(UIImage(named: imageName), for: .normal)
            btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
            
            btn.sizeToFit()
        }
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        // 实例化 UIBarButtonItem
        self.init(customView: btn)
    }
}

