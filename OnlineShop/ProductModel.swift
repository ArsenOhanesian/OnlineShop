//
//  ProductModel.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import Foundation
import FirebaseFirestore

struct ProductModel: Identifiable, Codable{
    @DocumentID var id: String?
    var name: String
    var descrioption: String
    var image: String
    var price: Int
    var isFavorite: Bool
    var quantityInCart: Int?
}
