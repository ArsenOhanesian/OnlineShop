//
//  ViewModel.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import Foundation
import FirebaseFirestore

final class ViewModel: ObservableObject{
    // MARK: - Properties
    private let db = Firestore.firestore().collection("shop")
    
    
    // MARK: - Methods
    func toggleFavorite(in product: ProductModel){
        guard let id = product.id else { return }
        db.document(id).updateData(["isFavorite" : !product.isFavorite])
    }
    
    func addToCart(_ product: ProductModel){
        guard let id = product.id else { return }
        db.document(id).updateData(["quantityInCart" : 1])
    }
}
