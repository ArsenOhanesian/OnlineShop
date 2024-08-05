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
    
    private let spacing: CGFloat = 25
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .trailing, spacing: spacing){
            
            // MARK: - Cancel Button
            CustomRemoteControlButton(name: Helper.Button.cancelButton,size: .title2) {
                vm.removeFromCart(product)
            }
            
            HStack{
                // MARK: - Decrease
                CustomRemoteControlButton(name: Helper.Button.decreaseButton) {
                    vm.decreaseQuantity(product)
                }
                
                // MARK: - Quantity
                if let quantityInCart = product.quantityInCart{
                    Text("\(quantityInCart)")
                        .titleFont()
                }
                
                // MARK: - Increase
                CustomRemoteControlButton(name: Helper.Button.increaseButton) {
                    vm.increaseQuantity(product)
                }
            }
        }
        .padding()
    }
}

