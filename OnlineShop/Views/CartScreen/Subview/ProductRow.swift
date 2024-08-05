//
//  ProductRow.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI

struct ProductRow: View {
    // MARK: - Properties
    let product: ProductModel
    
    private let imageSize: CGFloat = 100
    private let spacing: CGFloat = 20
    private let padding: CGFloat = 10
    private let cornerRadius: CGFloat = 20
    
    // MARK: - Body
    var body: some View {
            ZStack(alignment: .trailing) {
                HStack(spacing: spacing){
                    
                    // MARK: - Image
                    if let url = URL(string: product.image){
                        CardImageView(url: url, width: imageSize, height: imageSize)
                    }
                    
                    // MARK: - Info
                    VStack(alignment: .leading, spacing: spacing){
                        Text(product.name)
                            .titleFont()
                        if let quantityInCart = product.quantityInCart {
                            let sum = product.price * quantityInCart
                            Text("₴ \(sum)")
                                .titleFont()
                        }
                    }
                    
                    Spacer()
                    
                    
                }
                .padding(padding)
                .background(.background)
                .cornerRadius(cornerRadius)
                
                // MARK: - Remote Control
                RemoteControllRowView(product: product)
            }
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.5), radius: 7, x: 5, y: 6)
            .padding(.horizontal, 10)
    }
}

#Preview {
    NavigationStack {
        ProductRow(product: ProductModel(
            name: "Ozelia",
            description: "ФУТУРИСТИЧНІ КРОСІВКИ, В ЯКИХ КОМФОРТНО ЦІЛИЙ ДЕНЬ. Можливо, ти далекий від 90-х, але Ozelia прийшли саме з тієї епохи яскравих експериментів. Натхненні архівними моделями adidas, ці масивні кросівки створені привертати увагу. Динамічний дизайн та підошва з м'якою, комфортною амортизацією Adiprene якомога краще підходять для активних днів. Модель виконана із перероблених матеріалів у рамках наших зобов'язань по скороченню пластикових відходів. 20% елементів верху мінімум на 50% складаються із перероблених матеріалів."
    ,
            image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-f76cb.appspot.com/o/products%2F%20OZELIA.jpeg?alt=media&token=13ebc194-7678-4aae-873d-4c6aac9cf3ad"
    ,
            price: 4999,
            isFavorite: false, quantityInCart: 3
        )).environmentObject(ViewModel())
    }
}


