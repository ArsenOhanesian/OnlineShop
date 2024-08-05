//
//  RemoteControllRowView.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI

struct RemoteControllRowView: View {
    // MARK: - Properties
    let product: ProductModel
    @EnvironmentObject var vm: ViewModel
    // MARK: - Body
    var body: some View {
        VStack(alignment: .trailing, spacing: 25){
            Button {
                vm.removeFromCart(product)
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
            }
            .buttonStyle(.plain)
            
            HStack{
                Button{
                    vm.decreaseQuantity(product)
                } label: {
                    Image(systemName: "minus.rectangle.fill")
                        .foregroundStyle(.primary)
                        .font(.title)
                }
                .buttonStyle(.plain)
                
                if let quantityInCart = product.quantityInCart{
                    Text("\(quantityInCart)")
                        .titleFont()
                }
                
                
                Button{
                    vm.increaseQuantity(product)
                } label: {
                    Image(systemName: "plus.rectangle.fill")
                        .foregroundStyle(.primary)
                        .font(.title)
                }
                .buttonStyle(.plain)
                
            }
        }
        .padding()
    }
}

