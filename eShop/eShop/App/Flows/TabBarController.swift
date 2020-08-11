//
//  TabBarController.swift
//  eShop
//
//  Created by Maksim Romanov on 11.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userInfoController = UserInfoController(user: UserSession.shared.user!)
        userInfoController.tabBarItem = UITabBarItem(title: "User Info", image: UIImage(systemName: "person"), tag: 0)

        let catalogController = CatalogController()
        catalogController.tabBarItem = UITabBarItem(title: "Catalog", image: UIImage(systemName: "folder"), tag: 1)

        let tabBarList = [userInfoController, catalogController]

        viewControllers = tabBarList
        self.selectedIndex = 1
    }

}
