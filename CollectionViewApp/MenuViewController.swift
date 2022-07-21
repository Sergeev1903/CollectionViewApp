//
//  ViewController.swift
//  CollectionViewApp
//
//  Created by Артем Сергеев on 18.07.2022.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet var menuCollectionView: UICollectionView!
    @IBOutlet var groupsCollectionView: UICollectionView!
    
    var group: Group!
    var selectedGroup: Group? {
        didSet {
            if let selectedGroup = selectedGroup {
                self.title = selectedGroup.name
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuCollectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        self.menuCollectionView.dataSource = self
        self.menuCollectionView.delegate = self
        
        self.groupsCollectionView.register(UINib(nibName: "GroupCell", bundle: nil), forCellWithReuseIdentifier: "GroupCell")
        self.groupsCollectionView.dataSource = self
        self.groupsCollectionView.delegate = self
        
        if let groups = group.groups, groups.count > 0 {
            selectedGroup = groups.first!
        } else {
            selectedGroup = group
        }
    }
    
    //When scroll products - grop switch on the same products group!
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == menuCollectionView {
            let cells = menuCollectionView.visibleCells
            if let cell = cells.first,
               let indexPath = self.menuCollectionView.indexPath(for: cell) {
                
                self.selectedGroup = self.group.groups![indexPath.item]
                
                self.groupsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                self.groupsCollectionView.reloadData()
            }
            
        }
    }
}

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let groups = group.groups {
            return groups.count
        } else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == groupsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCell", for: indexPath) as! GroupCell
            
            
            let group = self.group.groups![indexPath.item]
            
            let isSelected = group.name == selectedGroup?.name
            
            cell.setUpCell(group: group, isSelected: isSelected)
            cell.layer.cornerRadius = 15
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
            let products = self.group.groups![indexPath.item].products
            let product = selectedGroup!.products![indexPath.item]
            
            cell.fullScreenHandler = fullScreenHandlerFor
            cell.setUpCell(products: products!)
            
            return cell
        }
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == groupsCollectionView {
            
            let groupName = self.group.groups![indexPath.item].name
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
            self.selectedGroup = self.group.groups![indexPath.item]
            
            self.groupsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.groupsCollectionView.reloadData()
            
            // Scroll collection items to start when change collection group
            self.menuCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.menuCollectionView.reloadData()
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

extension MenuViewController {
    func fullScreenHandlerFor(cell: ProductCell, indexProduct: Int) {
        if let indexPath = self.menuCollectionView.indexPath(for: cell) {
            let products = self.group.groups![indexPath.item].products!
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "FullProductViewController") as! FullProductViewController
            vc.products = products
            vc.indexPath = IndexPath(row: indexProduct, section: 0)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        print("fullScreenHandler")
    }
}
