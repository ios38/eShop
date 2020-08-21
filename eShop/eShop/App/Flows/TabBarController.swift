//
//  TabBarController.swift
//  eShop
//
//  Created by Maksim Romanov on 11.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userController = UserController()
        userController.tabBarItem = UITabBarItem(title: "User", image: UIImage(systemName: "person"), tag: 0)

        let catalogController = CatalogController()
        catalogController.navigationItem.title = "Catalog"
        
        let basketController = BasketController()
        basketController.tabBarItem = UITabBarItem(title: "Basket", image: UIImage(systemName: "cart"), tag: 2)

        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(title: "Catalog", image: UIImage(systemName: "folder"), tag: 1)
        navigationController.viewControllers = [catalogController]
        //navigationController.navigationBar.backgroundColor = .darkGray
        
        let tabBarList = [userController, navigationController, basketController]

        viewControllers = tabBarList
        self.selectedIndex = 1
        Analytics.logEvent("TabBarController_loaded", parameters: nil)

    }

}
