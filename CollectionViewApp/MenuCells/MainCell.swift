//
//  MainCell.swift
//  CollectionViewApp
//
//  Created by Артем Сергеев on 21.07.2022.
//

import UIKit

class MainCell: UICollectionViewCell {

    @IBOutlet var imageMainCell: UIImageView!
    @IBOutlet var labelMainCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUp(group: Group) {
        self.imageMainCell.image = group.image
        self.labelMainCell.text = group.name
    }
}
