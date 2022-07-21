//
//  FullProductCell.swift
//  CollectionViewApp
//
//  Created by Артем Сергеев on 21.07.2022.
//

import UIKit

class FullProductCell: UICollectionViewCell {
    
    
    @IBOutlet var fullProductImage: UIImageView!
    @IBOutlet var fullProductName: UILabel!
    @IBOutlet var fullProductPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setUpCell(product: Product) {
        self.fullProductImage.image = product.image
        self.fullProductName.text = product.name
        self.fullProductPrice.text = "\(product.price) UAH."
        
//        self.fullProductImage.backgroundColor
        self.fullProductImage.layer.cornerRadius = 50
        self.fullProductName.textColor = .white
        self.fullProductPrice.textColor = .white
    }
}
