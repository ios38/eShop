//
//  ProductController.swift
//  eShop
//
//  Created by Maksim Romanov on 15.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit
import SnapKit

class ProductController: UIViewController {
    var product: Product
    lazy var productInfoController = ProductInfoController(product: product)
    lazy var productReviewsController = ProductReviewsController(product: product)

    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = product.name

        addProductInfoController()
        addProductReviewsController()
    }
    
    private func addProductInfoController() {
        self.addChild(self.productInfoController)
        self.view.addSubview(self.productInfoController.view)
        self.productInfoController.didMove(toParent: self)
        
        self.productInfoController.view.translatesAutoresizingMaskIntoConstraints = false
        productInfoController.view.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
    }
    
    private func addProductReviewsController() {
        self.addChild(self.productReviewsController)
        self.view.addSubview(self.productReviewsController.view)
        self.productReviewsController.didMove(toParent: self)
        
        self.productReviewsController.view.translatesAutoresizingMaskIntoConstraints = false
        productReviewsController.view.snp.makeConstraints { make in
            make.top.equalTo(productInfoController.view.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }

}
