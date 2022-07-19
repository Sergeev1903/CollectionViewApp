//
//  Menu.swift
//  CollectionViewApp
//
//  Created by Артем Сергеев on 19.07.2022.
//

import UIKit


struct Group {
    
    var name: String
    var products: [Product]
}

struct Product {
    
    var name: String
    var price: Float
    var image: UIImage
}

class Menu {
    
    var groups = [Group]()
    
    init () {
        setUp()
    }
    
    func setUp(){
        
        let product1 = Product(name: "Pizza 1", price: 100, image: UIImage(named: "product1")!)
        let product2 = Product(name: "Pizza 2", price: 200, image: UIImage(named: "product1")!)
        let product3 = Product(name: "Pizza 3", price: 300, image: UIImage(named: "product1")!)
        
        let product4 = Product(name: "Burger Double 1", price: 100, image: UIImage(named: "product2")!)
        let product5 = Product(name: "Burger Double 2", price: 200, image: UIImage(named: "product2")!)
        let product6 = Product(name: "Burger Double 3", price: 300, image: UIImage(named: "product2")!)
        
        let product7 = Product(name: "Burger Ligth 1", price: 100, image: UIImage(named: "product3")!)
        let product8 = Product(name: "Burger Ligth 2", price: 200, image: UIImage(named: "product3")!)
        let product9 = Product(name: "Burger Ligth 3", price: 300, image: UIImage(named: "product3")!)
        
        let products1 = [product1, product2, product3]
        let products2 = [product4, product5, product6]
        let products3 = [product7, product8, product9]
        
        let group1 = Group(name: "Pizza", products: products1)
        let group2 = Group(name: "Burger Double", products: products2)
        let group3 = Group(name: "Burger Ligth", products: products3)
        
        let group4 = Group(name: "Pizza 2", products: products1)
        let group5 = Group(name: "Burger Double 2", products: products2)
        let group6 = Group(name: "Burger Ligth 2", products: products3)
        
        let group7 = Group(name: "Pizza 3", products: products1)
        let group8 = Group(name: "Burger Double 3", products: products2)
        let group9 = Group(name: "Burger Ligth 3", products: products3)
        
        
        self.groups = [group1, group2, group3, group4, group5, group6, group7, group8, group9]

}
}
