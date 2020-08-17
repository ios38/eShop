//
//  BasketResult.swift
//  eShop
//
//  Created by Maksim Romanov on 03.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation

struct GetBasketResult: Codable {
    let amount: Int
    let countGoods: Int
    let contents: [Product]
}
/*
 {
   "amount": 46600,
   "countGoods": 2,
   "contents": [
     {
       "id_product": 123,
       "product_name": "Ноутбук",
       "price": 45600//,
       //"quantity": 1
     },
     {
       "id_product": 456,
       "product_name": "Мышка",
       "price": 1000//,
       //"quantity": 1
     }
   ]
 }
 */

struct ChangeBasketResult: Codable {
    let result: Int
}
