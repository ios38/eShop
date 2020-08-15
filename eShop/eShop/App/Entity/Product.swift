//
//  Product.swift
//  eShop
//
//  Created by Maksim Romanov on 27.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation
//swiftlint:disable identifier_name

struct Product: Codable {
    let id: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
    }
}

/*
[
{
    "id_product": 123,
    "product_name": "Ноутбук",
    "price": 45600
},
{
    "id_product": 456,
    "product_name": "Мышка",
    "price": 1000
}
]
*/
