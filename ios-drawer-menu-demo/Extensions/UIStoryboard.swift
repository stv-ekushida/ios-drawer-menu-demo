//
//  UIStoryboard.swift
//  ios-drawer-menu-demo
//
//  Created by Eiji Kushida on 2017/03/14.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

public extension UIStoryboard {
    
    /// Storyboardからインスタンスを取得する
    class func getViewController<T: UIViewController>(storyboardName: String,
                                 identifier: String) -> T? {
        
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(
            withIdentifier: identifier) as? T
    }
}
