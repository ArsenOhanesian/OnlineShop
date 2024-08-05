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
    @FirestoreQuery(collectionPath: "shop", predicates: [.isGreaterThan("quantityInCart", 0)]) var products: [ProductModel]
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(products) { product in
                ProductRow(product: product)
            }
        }
        .padding(.horizontal, 10)
        .navigationTitle("Корзина")
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    ProductRow(product: ProductModel(
        name: "Ozelia",
        description: "ФУТУРИСТИЧНІ КРОСІВКИ, В ЯКИХ КОМФОРТНО ЦІЛИЙ ДЕНЬ. Можливо, ти далекий від 90-х, але Ozelia прийшли саме з тієї епохи яскравих експериментів. Натхненні архівними моделями adidas, ці масивні кросівки створені привертати увагу. Динамічний дизайн та підошва з м'якою, комфортною амортизацією Adiprene якомога краще підходять для активних днів. Модель виконана із перероблених матеріалів у рамках наших зобов'язань по скороченню пластикових відходів. 20% елементів верху мінімум на 50% складаються із перероблених матеріалів."
,
        image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-f76cb.appspot.com/o/products%2F%20OZELIA.jpeg?alt=media&token=13ebc194-7678-4aae-873d-4c6aac9cf3ad"
,
        price: 4999,
        isFavorite: false, quantityInCart: 3
    ))
}
