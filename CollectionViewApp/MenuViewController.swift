//
//  ViewController.swift
//  CollectionViewApp
//
//  Created by Артем Сергеев on 18.07.2022.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var groupsCollectionView: UICollectionView!
    
    var menu = Menu()
    var selectedGroupIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.groupsCollectionView.register(UINib(nibName: "GroupCell", bundle: nil), forCellWithReuseIdentifier: "GroupCell")
        self.groupsCollectionView.dataSource = self
        self.groupsCollectionView.delegate = self
    }
}

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == groupsCollectionView {
           return menu.groups.count
        }
        let group = menu.groups[selectedGroupIndex]
        return group.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
        if collectionView == groupsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCell", for: indexPath) as! GroupCell
            let group = menu.groups[indexPath.item]
            cell.setUpCell(group: group)
            
            cell.nameGroup.textColor = .darkGray
            cell.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8032129553)
            cell.layer.cornerRadius = 15
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
            let group = menu.groups[selectedGroupIndex]
            let product = group.products[indexPath.item]
            
            cell.setUpCell(product: product)
            cell.productImage.layer.cornerRadius = 50
            cell.productName.textColor = .white
            cell.productPrice.textColor = .white
            
            return cell
        }
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == groupsCollectionView {
            
            let groupName = menu.groups[indexPath.item].name
            let width = groupName.widthOfString(usingFont: UIFont.systemFont(ofSize: 17))
            return CGSize(width: width + 20, height: collectionView.frame.height)
        } else {
            return CGSize(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.width)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    //MARK: UICollectionViewDelegate - show group item collection!
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == groupsCollectionView {
            self.selectedGroupIndex = indexPath.item
            // Scroll collection items to start when change collection group
            self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
            self.collectionView.reloadData()
        }
    }
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: fontAttributes)
        return ceil(size.width)
    }
}
