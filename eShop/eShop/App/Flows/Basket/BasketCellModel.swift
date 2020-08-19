//
//  BasketCellModel.swift
//  eShop
//
//  Created by Maksim Romanov on 19.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation

struct BasketCellModel {
    let product: String
    let price: String
    let qty: String
    let subtotal: String
}

final class BasketCellModelFactory {
    
    static func cellModel(from basketItem: Product) -> BasketCellModel {
        return BasketCellModel(product: basketItem.name,
                               price: "Price: \(basketItem.price)",
                               qty: "Qty: 1",
                               subtotal: "Subtotal: \(basketItem.price * 1)")
    }
}
