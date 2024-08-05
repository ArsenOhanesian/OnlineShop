//
//  DetailInfoView.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI

struct DetailInfoView: View {
    // MARK: - Proiperties
    @EnvironmentObject var vm: ViewModel
    let product: ProductModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                Text(product.name)
                    .titleFont()
                Spacer()
                Text("₴ \(product.price)")
                    .titleFont()
            }
            
            Text(product.description)
                .subTitleFont()
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(8)
            
            Spacer()
            
            CustomMainButton(title: "Add To Card") {
                vm.addToCart(product)
            }
            
        }
        .padding(.horizontal, 30)
    }
}
