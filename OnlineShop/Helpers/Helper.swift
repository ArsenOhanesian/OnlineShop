//
//  Helper.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import Foundation

enum Helper{
    enum Titles{
        static let main = "Товари"
        static let favorite = "Обране"
        static let cart = "Корзина"
    }
    
    enum Firebase{
        static let shop = "shop"
        static let isFavorite = "isFavorite"
        static let quantityInCart = "quantityInCart"
    }
    
    enum Images{
        static let cart = "cart.fill"
        static let heart = "heart.fill"
        static let chevron = "chevron.left"
    }
    
    enum Button{
        static let buy = "Купити"
        static let add = "Додати в кошик"
        
        static let cancelButton = "xmark.circle.fill"
        static let decreaseButton = "minus.rectangle.fill"
        static let increaseButton = "plus.rectangle.fill"
    }
}
