//
//  BasketCell.swift
//  eShop
//
//  Created by Maksim Romanov on 19.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit

class BasketCell: UITableViewCell {

    // MARK: - Subviews
    private(set) lazy var productImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "gift.fill"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private(set) lazy var productLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18.0)
        return label
    }()
    
    private(set) lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var qtyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var subtotalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()

    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: BasketCellModel) {
        self.productLabel.text = cellModel.product
        self.priceLabel.text = cellModel.price
        self.qtyLabel.text = cellModel.qty
        self.subtotalLabel.text = cellModel.subtotal
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.productLabel, self.priceLabel, self.qtyLabel, self.subtotalLabel].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addProductImageView()
        self.addProductLabel()
        self.addPriceLabel()
        self.addQtyLabel()
        self.addSubtotalLabel()
    }
    
    private func addProductImageView() {
        self.contentView.addSubview(self.productImageView)
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(25)
            make.leading.equalTo(self.contentView).offset(10)
            make.width.equalTo(50)
            //make.height.equalTo(64)
        }
    }

    private func addProductLabel() {
        self.contentView.addSubview(self.productLabel)
        productLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(10)
            make.leading.equalTo(productImageView.snp.trailing).offset(10)
            make.trailing.equalTo(self.contentView)
            //make.height.equalTo(64)
        }
    }
    
    private func addPriceLabel() {
        self.contentView.addSubview(self.priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(productLabel.snp.bottom).offset(10)
            make.leading.equalTo(productImageView.snp.trailing).offset(10)
            //make.trailing.equalTo(self.contentView)
            //make.height.equalTo(64)
        }
    }
    
    private func addQtyLabel() {
        self.contentView.addSubview(self.qtyLabel)
        qtyLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.top)
            make.leading.equalTo(priceLabel.snp.trailing).offset(10)
            //make.trailing.equalTo(self.contentView)
            //make.height.equalTo(64)
        }
    }
    
    private func addSubtotalLabel() {
        self.contentView.addSubview(self.subtotalLabel)
        subtotalLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.top)
            make.leading.equalTo(qtyLabel.snp.trailing).offset(10)
            //make.trailing.greaterThanOrEqualTo(self.contentView).inset(10)
            make.bottom.equalTo(self.contentView).inset(10)
        }
    }

}
