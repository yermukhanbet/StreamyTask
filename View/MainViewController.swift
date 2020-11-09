//
//  MainViewController.swift
//  StreamyTask
//
//  Created by Yessen Yermukhanbet on 11/9/20.
//  Copyright © 2020 Yessen Yermukhanbet. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var tabBar = UITabBarController()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tabBar.view)
        setupTabBar()
    }
    let krwImage = UIImage(systemName: "dollarsign.circle", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
    let btcImage = UIImage(systemName: "bitcoinsign.circle", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
    
    private func setupTabBar(){
        let dashboardViewController = UINavigationController(rootViewController: KRWViewController())
        dashboardViewController.title = "KRW"
        dashboardViewController.tabBarItem.image = krwImage
        let settingsViewController = UINavigationController(rootViewController: BTCViewController())
        settingsViewController.title = "BTC"
        settingsViewController.tabBarItem.image = btcImage
        self.tabBar.viewControllers = [dashboardViewController,settingsViewController]
        self.tabBar.tabBar.backgroundColor = .white
        self.tabBar.tabBar.unselectedItemTintColor = .lightGray
        self.tabBar.tabBar.tintColor = .red
    }
}
