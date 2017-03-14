//
//  LeftMenuTableViewCell.swift
//  ios-drawer-menu-demo
//
//  Created by Kushida　Eiji on 2017/03/14.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

struct LeftMenuTableViewCellData {

    var imageUrl: String
    var text: String
    
    init(imageUrl: String, text: String) {
        self.imageUrl = imageUrl
        self.text = text
    }
}

class LeftMenuTableViewCell : UITableViewCell {
    
    @IBOutlet weak var dataImage: UIImageView!
    @IBOutlet weak var dataText: UILabel!
    
    var item: LeftMenuTableViewCellData? {
        didSet {    
            self.dataText.text = item?.text
        }
    }
    
    class func height() -> CGFloat {
        return 80
    }
}

