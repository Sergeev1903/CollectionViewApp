//
//  ProductCell.swift
//  CollectionViewApp
//
//  Created by Артем Сергеев on 19.07.2022.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet var productTableView: UITableView!
    
    private var products = [Product]()
    
    //Переход спомощью обработчика (handler)
    var fullScreenHandler: ((_ cell: ProductCell) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.productTableView.dataSource = self
        self.productTableView.delegate = self
        self.productTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    /// Обнуляем перед переиспользованием.
    // Важно когда данные из сети!
    /// Что бы не было бага визуального задвоения
    /// или для нового элемента используютья данные из пред. элемента
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setUpCell(products: [Product]) {
        self.products = products
        self.productTableView.reloadData()
    }

}

extension ProductCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        
        let product = self.products[indexPath.row]
        cell.setUpCell(product: product)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.productTableView.deselectRow(at: indexPath, animated: true)
        fullScreenHandler?(self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //автоматический расчет высоты
        return UITableView.automaticDimension
    }
    
    
}
