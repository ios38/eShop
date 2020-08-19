//
//  BasketController.swift
//  eShop
//
//  Created by Maksim Romanov on 18.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit

class BasketController: UIViewController, UITableViewDataSource {
    var basketView = BasketView()
    var basket = [Product]()
    var basketRequestFactory: BasketRequestFactory?
    let requestFactory = RequestFactory()

    override func loadView() {
        super.loadView()
        self.view = basketView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.basketView.tableView.register(BasketCell.self, forCellReuseIdentifier: "BasketCell")
        self.basketView.tableView.dataSource = self
        loadBasket()
    }
 
    func loadBasket() {
        self.basketRequestFactory = requestFactory.makeBasketRequestFactory()
        guard let basketRequestFactory = self.basketRequestFactory else { return }
        let userId = UserSession.shared.user?.id ?? 0
        basketRequestFactory.getBasket(userId: userId) { response in
            switch response.result {
            case .success(let basket):
                //print(basket)
                self.basket = basket.contents
                self.basketView.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath)
        guard let cell = dequeuedCell as? BasketCell else {
            return dequeuedCell
        }
        let basketItem = basket[indexPath.row]
        let cellModel = BasketCellModelFactory.cellModel(from: basketItem)
        cell.configure(with: cellModel)

        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "BasketCell")
        //cell.textLabel?.text = basket[indexPath.row].name
        //cell.detailTextLabel?.text = "\(basket[indexPath.row].price)"
        //cell.backgroundColor = .darkGray
        return cell
    }
    
}
