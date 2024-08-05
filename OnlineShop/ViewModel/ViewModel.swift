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
    @Published var cartItems: [ProductModel] = []
    
    var cartItemCount: Int {
        cartItems.filter { $0.quantityInCart ?? 0 > 0}.count
    }
    
    var totalPrice: Int {
        cartItems.reduce(0) { $0 + ($1.price * ($1.quantityInCart ?? 0))}
    }
    
    // MARK: - Initializer
    init() {
        fetchItems()
    }
    
    // MARK: - Public Methods
    
    
    func toggleFavorite(in product: ProductModel){
        updateProduct(product, data: ["isFavorite" : !product.isFavorite])
    }
    
    func addToCart(_ product: ProductModel){
        updateProduct(product, data: ["quantityInCart" : 1])
    }
    
    func removeFromCart(_ product: ProductModel){
        updateProduct(product, data: ["quantityInCart" : 0])
        
    }
    
    func increaseQuantity(_ product : ProductModel){
        let newQuantity = (product.quantityInCart ?? 0) + 1
        updateProduct(product, data: ["quantityInCart" : newQuantity])
    }
    
    func decreaseQuantity(_ product: ProductModel){
        let currentQuantity = product.quantityInCart ?? 0
        let newQuantity = max(currentQuantity - 1, 1)
        updateProduct(product, data: ["quantityInCart": newQuantity])
    }
    
    
    // MARK: - Private Methods
    private func fetchItems(){
        db.addSnapshotListener { snap, error in
            guard let document = snap?.documents else {
                print("Error fetching documents: \(error!.localizedDescription)")
                return
            }
            
            self.cartItems = document.compactMap { document -> ProductModel? in
                try? document.data(as: ProductModel.self) }
        }
    }
    
    private func updateProduct(_ product: ProductModel, data: [String : Any]){
        guard let id = product.id else { return }
        db.document(id).updateData(data)
    }
}
