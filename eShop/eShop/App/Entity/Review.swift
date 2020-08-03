//
//  Review.swift
//  eShop
//
//  Created by Maksim Romanov on 01.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation

struct Review: Codable {
    let userName: String
    let review: String
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case review = "review"
    }
}
