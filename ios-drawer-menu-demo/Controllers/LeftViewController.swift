//
//  LeftViewController.swift
//  ios-drawer-menu-demo
//
//  Created by Kushida　Eiji on 2017/03/14.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

enum LeftMenu: Int {
    case main = 0
    case taguchi
    case motoyama
    case okudera
    
    func viewController() -> UIViewController {
        
        switch self {
        case .main:
            return UIStoryboard.getViewController(storyboardName: "Main",
                                                  identifier: "MainViewController")!
        case .taguchi:
            return UIStoryboard.getViewController(storyboardName: "Main",
                                                  identifier: "TaguchiViewController")!
        case .motoyama:
            return UIStoryboard.getViewController(storyboardName: "Main",
                                                  identifier: "MotoyamaViewController")!
        case .okudera:
            return UIStoryboard.getViewController(storyboardName: "Main",
                                                  identifier: "OkuderaViewController")!
        }
    }
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController : UIViewController, LeftMenuProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var menus = ["TOP","田口","奥寺","本山"]
    var mainViewController: UIViewController!
    var taguchiViewController: UIViewController!
    var motoyamaViewController: UIViewController!
    var okuderaViewController: UIViewController!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let taguchiViewController = LeftMenu.taguchi.viewController()
        self.taguchiViewController = UINavigationController(rootViewController: taguchiViewController)
        
        let motoyamaViewController = LeftMenu.motoyama.viewController()
        self.motoyamaViewController = UINavigationController(rootViewController: motoyamaViewController)

        let okuderaViewController = LeftMenu.okudera.viewController()
        self.okuderaViewController = UINavigationController(rootViewController: okuderaViewController)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .main:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .taguchi:
            self.slideMenuController()?.changeMainViewController(self.taguchiViewController, close: true)
        case .motoyama:
            self.slideMenuController()?.changeMainViewController(self.motoyamaViewController, close: true)
        case .okudera:
            self.slideMenuController()?.changeMainViewController(self.okuderaViewController, close: true)
        }
    }
}

//MARK:-UITableViewDelegate
extension LeftViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return LeftMenuTableViewCell.height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

//MARK:-UITableViewDataSource
extension LeftViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LeftMenuTableViewCell.className,
                                                 for: indexPath) as! LeftMenuTableViewCell
        cell.item = LeftMenuTableViewCellData(imageUrl: "", text: menus[indexPath.row])
        return cell
    }
}
