//
//  GroopCell.swift
//  CollectionViewApp
//
//  Created by Артем Сергеев on 19.07.2022.
//

import UIKit

class GroupCell: UICollectionViewCell {
    
    @IBOutlet var nameGroup: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpCell(group: Group) {
        
        self.nameGroup.text = group.name
    }
}
