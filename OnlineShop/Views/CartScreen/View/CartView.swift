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
    
    @FirestoreQuery(collectionPath: Helper.Firebase.shop) private var products: [ProductModel]
    private let hPadding: CGFloat = 30
    
    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(products.filter { $0.quantityInCart ?? 0 > 0 }) { product in
                    ProductRow(product: product)
                }
            }
            
            
            Text("Загалом: \(vm.totalPrice)")
                .titleFont()
                .padding(.bottom)
            
            CustomMainButton(title: Helper.Button.buy) {}
                .padding(.horizontal, hPadding)
        }
        .navigationTitle(Helper.Titles.cart)
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    CartView().environmentObject(ViewModel())
}
