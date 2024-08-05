//
//  CartView.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI
import FirebaseFirestore
struct CartView: View {
    // MARK: - Properties
    @FirestoreQuery(collectionPath: "shop",
                    predicates: [.isGreaterThan("quantityInCart", 0)]) private var products: [ProductModel]
    
    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(products) { product in
                    ProductRow(product: product)
                }
            }
            
            
            Text("Total: \(vm.totalPrice)")
                .titleFont()
                .padding(.bottom)
            
            CustomMainButton(title: "Buy") {}
                .padding(.horizontal, 30)
        }
        .navigationTitle("Корзина")
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    CartView()
}
