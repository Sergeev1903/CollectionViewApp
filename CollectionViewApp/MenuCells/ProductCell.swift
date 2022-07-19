//
//  ProductCell.swift
//  CollectionViewApp
//
//  Created by Артем Сергеев on 19.07.2022.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    /// Обнуляем перед переиспользованием.
    // Важно когда данные из сети!
    /// Что бы не было бага визуального задвоения
    /// или для нового элемента используютья данные из пред. элемента
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImage.image = nil
    }


   func setUpCell (product: Product) {
        self.productImage.image = product.image
       self.productName.text = product.name
       self.productPrice.text = "\(product.price) UAH."
    }
}
