//
//  ProductReviewsController.swift
//  eShop
//
//  Created by Maksim Romanov on 15.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit

class ProductReviewsController: UIViewController, UITableViewDataSource {
    var product: Product
    var reviews = [Review]()
    var productReviewsView = ProductReviewsView()
    var reviewsRequestFactory: ReviewsRequestFactory?
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
        self.view = productReviewsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.productReviewsView.reviewsTableView.dataSource = self
        loadReviews()
    }
    
    func loadReviews() {
        self.reviewsRequestFactory = requestFactory.makeReviewsRequestFactory()
        guard let reviewsRequestFactory = self.reviewsRequestFactory else { return }
        
        reviewsRequestFactory.getReviews(productId: product.id) { response in
            switch response.result {
            case .success(let result):
                //print(result)
                self.reviews = result.reviews
                self.productReviewsView.reviewsTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    //MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ReviewCell")
        cell.textLabel?.text = reviews[indexPath.row].userName
        cell.detailTextLabel?.text = reviews[indexPath.row].review
        //cell.backgroundColor = .darkGray
        return cell

    }
    
}
