//
//  ProductInfoController.swift
//  eShop
//
//  Created by Maksim Romanov on 15.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class ProductInfoController: UIViewController {
    var product: Product
    var productInfoView = ProductInfoView()
    var basketRequestFactory: BasketRequestFactory?
    let requestFactory = RequestFactory()

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
        productInfoView.buyButton.addTarget(self, action: #selector(buyButtonAction), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc func buyButtonAction() {
        self.basketRequestFactory = requestFactory.makeBasketRequestFactory()
        
        guard let basketRequestFactory = self.basketRequestFactory else { return }
        basketRequestFactory.addToBasket(productId: self.product.id, quantity: 1) { response in
            switch response.result {
            case .success:
                Analytics.logEvent("Product_added_to_Basket", parameters: ["product": self.product.name])
                self.tabBarController?.selectedIndex = 2
                self.navigationController?.popViewController(animated: true)
                print("Product '\(self.product.name)' added to basket")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
