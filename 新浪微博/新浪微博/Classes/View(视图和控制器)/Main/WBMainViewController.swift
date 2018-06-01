 //
//  WBMainViewController.swift
//  新浪微博
//
//  Created by 华惠友 on 2017/9/17.
//  Copyright © 2017年 华惠友. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildControllers()
        setupComposeButton()
    }
    
    // MARK: - 监听方法
    // 撰写微博
    // FIXME: - 没有实现
    // @objc private
    // private 能够保证方法私有, 仅在当前对象被访问
    // @objc 允许这个函数在运行时通过 OC 的消息机制被调用!
    func composeStatus() {
        print("撰写微博")
    }
    
    // MARK: - 私有控件
    lazy var composeButton: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
}
 
// extension 类似于OC中的分类, 在 Swift 中还可以用来切分代码块
// 可以把相近功能的函数,放在一个 extension 中
// 便于代码维护
// 注意: 和OC 的分类一样, extension 中不能定义属性
 // MARK: - 设置界面
 extension WBMainViewController {
    
    /// 设置撰写按钮
    fileprivate func setupComposeButton() {
        tabBar.addSubview(composeButton)
        
        // 计算按钮的宽度
        let count = CGFloat(childViewControllers.count)
        // 将向内缩进的宽度减少, 能够让按钮的宽度变大, 盖住容错点, 防止穿帮
        let w = tabBar.bounds.width / count - 1
        
        // CGRectInsert 正数向内缩进, 负数向外扩展(左右 上下)
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        
        // 按钮监听方法
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
    }
    
    /// 设置所有子控制器
    func setupChildControllers() {
        
        let array = [
            ["clsName": "WBHomeViewController","title": "首页","imageName": "home"],
            ["clsName": "WBMessageViewController","title": "消息","imageName": "message_center"],
            ["clsName": "UIViewController"],
            ["clsName": "WBDiscoverViewController","title": "发现","imageName": "discover"],
            ["clsName": "WBProfileViewController","title": "我","imageName": "profile"],
        ]
        
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(contoller(dict: dict))
        }
        
        viewControllers = arrayM
    }
    
    
    /// 使用字典创建一个子控制器
    ///
    /// - Parameter dict: 信息字典[clsName, title, imageName]
    /// - Returns: 自控制器
    private func contoller(dict: [String: String]) -> UIViewController {
        
        // 1.取得字典内容
        guard let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type else {
                return UIViewController()
        }
        
        // 2.创建视图控制器
        // 1> 将 clsName 转换成 cls
        let vc = cls.init()
        
        vc.title = title
        
        // 3.设置图像
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        // 4.设置 tabbar 的标题字体
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .highlighted)
        // 系统默认是 12 号字, 修改字体大小, 要设置 Normal 的字体大小
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 12)], for: .normal)
        
        // 实例化导航控制器的时候, 会调用 push 方法 将 rootVC 压栈
        let nav = WBNavgationController(rootViewController: vc)
        
        return nav
    }
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
