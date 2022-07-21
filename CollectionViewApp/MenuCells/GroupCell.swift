//
//  GroopCell.swift
//  CollectionViewApp
//
//  Created by Артем Сергеев on 19.07.2022.
//

import UIKit

class GroupCell: UICollectionViewCell {
    
    @IBOutlet var nameGroup: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8032129553)
        self.nameGroup.textColor = .darkGray
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpCell(group: Group, isSelected: Bool) {
        
        self.nameGroup.text = group.name
        
        if isSelected {
            self.contentView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 0.803937293)
            self.nameGroup.textColor = .white
        } else {
            self.contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8032129553)
            self.nameGroup.textColor = .darkGray
            
        }
    }
}
