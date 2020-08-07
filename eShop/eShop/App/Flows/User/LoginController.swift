//
//  LoginController.swift
//  eShop
//
//  Created by Maksim Romanov on 07.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit

final class LoginController: UIViewController {
    
    override func loadView() {
        super.loadView()
        self.view = LoginView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let loginView = LoginView(frame: self.view.frame)
//        self.view = loginView
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
