//
//  ProductInfoController.swift
//  eShop
//
//  Created by Maksim Romanov on 15.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit

class ProductInfoController: UIViewController {
    var product: Product
    var productInfoView = ProductInfoView()

    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.view = productInfoView
        productInfoView.productNameLabel.text = product.name
        productInfoView.productPriceLabel.text = "price: \(product.price)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
