//
//  ProductTableViewCell.swift
//  CollectionViewApp
//
//  Created by Артем Сергеев on 21.07.2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0.7993325745)
        self.layer.cornerRadius = 15
        
        let selectedCustomView = UIView()
        selectedCustomView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 0.803937293)
        selectedCustomView.layer.cornerRadius = 15
        self.selectedBackgroundView = selectedCustomView
        
        
    }
    
    func setUpCell(product: Product) {
        self.productImage.image = product.image
        self.productName.text = product.name
        self.productPrice.text = "\(product.price) UAH."
        
    }
}

extension ProductTableViewCell {
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 10
            frame.origin.x += 10
            frame.size.height -= 10
            frame.size.width -= 20
            super.frame = frame
        }
    }
}
