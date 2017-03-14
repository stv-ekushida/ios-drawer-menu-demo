//
//  NSObject.swift
//  ios-drawer-menu-demo
//
//  Created by Eiji Kushida on 2017/03/14.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import Foundation

public extension NSObject {
    
    /// クラス名を取得する
    static var className: String {
        get {
            return String(describing: self)
        }
    }
}
