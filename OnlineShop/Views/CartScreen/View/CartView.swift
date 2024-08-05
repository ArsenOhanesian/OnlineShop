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
    @EnvironmentObject var vm: ViewModel
    @FirestoreQuery(collectionPath: "shop") private var products: [ProductModel]
    
    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(products.filter { $0.quantityInCart ?? 0 > 0 }) { product in
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
    CartView().environmentObject(ViewModel())
}
