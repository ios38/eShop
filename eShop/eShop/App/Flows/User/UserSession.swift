//
//  UserSession.swift
//  eShop
//
//  Created by Maksim Romanov on 11.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation

class UserSession {
    static let shared = UserSession()
    var user: User?
}
