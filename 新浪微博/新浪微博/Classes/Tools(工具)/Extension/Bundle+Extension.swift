//
//  Bundle+Extension.swift
//  新浪微博
//
//  Created by 华惠友 on 2017/9/17.
//  Copyright © 2017年 华惠友. All rights reserved.
//

import Foundation

extension Bundle {
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
