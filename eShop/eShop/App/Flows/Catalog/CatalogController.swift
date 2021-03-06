//
//  CatalogController.swift
//  eShop
//
//  Created by Maksim Romanov on 11.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class CatalogController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var catalogView = CatalogView()
    var catalog = [Product]()
    var catalogRequestFactory: CatalogRequestFactory?
    let requestFactory = RequestFactory()

    override func loadView() {
        super.loadView()
        self.view = catalogView
        Analytics.logEvent("load_CatalogController", parameters: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.catalogView.tableView.dataSource = self
        self.catalogView.tableView.delegate = self
        loadCatalog()
    }
    
    func loadCatalog() {
        self.catalogRequestFactory = requestFactory.makeCatalogRequestFactory()
        guard let catalogRequestFactory = self.catalogRequestFactory else { return }
        catalogRequestFactory.getCatalog(page: 1, category: 1) { response in
            switch response.result {
            case .success(let catalog):
                //print(catalog)
                self.catalog = catalog
                self.catalogView.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "CatalogCell")
        cell.textLabel?.text = catalog[indexPath.row].name
        cell.detailTextLabel?.text = "\(catalog[indexPath.row].price)"
        //cell.backgroundColor = .darkGray
        return cell
    }

    //MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let product = catalog[indexPath.row]
        let productController = ProductController(product: product)
        self.navigationController?.pushViewController(productController, animated: true)

    }
}
