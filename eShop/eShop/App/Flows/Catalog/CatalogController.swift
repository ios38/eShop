//
//  CatalogController.swift
//  eShop
//
//  Created by Maksim Romanov on 11.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit

class CatalogController: UIViewController, UITableViewDataSource {
    var catalogView = CatalogView()
    var goods = [Good]()
    var goodsRequestFactory: GoodsRequestFactory?
    let requestFactory = RequestFactory()

    override func loadView() {
        super.loadView()
        self.view = catalogView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.catalogView.tableView.dataSource = self
        loadGoods()
    }
    
    func loadGoods() {
        self.goodsRequestFactory = requestFactory.makeGoodsRequestFactory()
        guard let goodsRequestFactory = self.goodsRequestFactory else { return }
        goodsRequestFactory.getGoods(page: 1, category: 1) { response in
            switch response.result {
            case .success(let catalog):
                //print(catalog)
                self.goods = catalog
                self.catalogView.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    
//MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = goods[indexPath.row].name
        cell.detailTextLabel?.text = "\(goods[indexPath.row].price)"
        return cell
    }
    
}
