//
//  String.swift
//  ios-drawer-menu-demo
//
//  Created by Kushida　Eiji on 2017/03/14.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }    
}

