//
//  CatalogResult.swift
//  eShop
//
//  Created by Maksim Romanov on 25.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation

typealias CatalogResult = [Product]

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

struct ProductResult: Codable {
    let result: Int
    let name: String
    let price: Int
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}

/*
{
  "result": 1,
  "product_name": "Ноутбук",
  "product_price": 45600,
  "product_description": "Мощный игровой ноутбук"
}
*/
