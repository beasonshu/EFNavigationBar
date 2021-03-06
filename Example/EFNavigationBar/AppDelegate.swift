//
//  AppDelegate.swift
//  EFNavigationBar
//
//  Created by wangrui on 2017/4/19.
//  Copyright © 2017年 wangrui. All rights reserved.
//

import UIKit
import EFNavigationBar

let MainNavBarColor = UIColor.init(red: 0 / 255.0, green: 175 / 255.0, blue: 240 / 255.0, alpha: 1)
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height
let kTabBarHeight = 49
let kNavBarHeight = 44

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white

        let firstNav = BaseNavigationController.init(rootViewController: NormalListController())
        let secondNav = BaseNavigationController.init(rootViewController: CustomListController())
        let thirdNav = BaseNavigationController.init(rootViewController: MoveListController())
        let tabBarVC = UITabBarController.init()
        tabBarVC.viewControllers = [firstNav, secondNav, thirdNav]
        setTabBarItems(tabBarVC: tabBarVC)

        window?.rootViewController = tabBarVC
        setNavBarAppearence()
        window?.makeKeyAndVisible()

        return true
    }

    func setTabBarItems(tabBarVC: UITabBarController) {
        let titles = ["常用",  "自定义导航栏", "移动导航栏"]
        let normalImages = ["mine", "mine", "mine"]
        let highlightImages = ["mineHighlight", "mineHighlight", "mineHighlight"]
        for (index, item) in (tabBarVC.tabBar.items ?? []).enumerated() {
            item.title = titles[index]
            item.image = UIImage(named: normalImages[index])?.withRenderingMode(.alwaysOriginal)
            item.selectedImage = UIImage(named: highlightImages[index])?.withRenderingMode(.alwaysOriginal)
        }
    }

    func setNavBarAppearence() {
        // 设置导航栏默认的背景颜色
        EFNavigationBar.defaultNavBarBarTintColor = UIColor.init(red: 0 / 255.0, green: 175 / 255.0, blue: 240 / 255.0, alpha: 1)
        // 设置导航栏所有按钮的默认颜色
        EFNavigationBar.defaultNavBarTintColor = .white
        // 设置导航栏标题默认颜色
        EFNavigationBar.defaultNavBarTitleColor = .white
        // 统一设置状态栏样式
        EFNavigationBar.defaultStatusBarStyle = .lightContent
        // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
        EFNavigationBar.defaultShadowImageHidden = true
    }
}
