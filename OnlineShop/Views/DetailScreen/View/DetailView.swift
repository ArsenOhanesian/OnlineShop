//
//  DetailView.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI

struct DetailView: View {
    // MARK: - Properties
    var product: ProductModel
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack{
                if let url = URL(string: product.image){
                    CardImageView(url: url, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.7)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 8)
                        .ignoresSafeArea()
                    
                    DetailInfoView(product: product)
                }
            }
            .background(.secondary.opacity(0.3))
            .navigationBarBackButtonHidden()
            BackButtonView()
                .padding(.leading)
        }
    }
}

#Preview {
    DetailView(
        product: ProductModel(
            name: "Ozelia",
            description: "ФУТУРИСТИЧНІ КРОСІВКИ, В ЯКИХ КОМФОРТНО ЦІЛИЙ ДЕНЬ. Можливо, ти далекий від 90-х, але Ozelia прийшли саме з тієї епохи яскравих експериментів. Натхненні архівними моделями adidas, ці масивні кросівки створені привертати увагу. Динамічний дизайн та підошва з м'якою, комфортною амортизацією Adiprene якомога краще підходять для активних днів. Модель виконана із перероблених матеріалів у рамках наших зобов'язань по скороченню пластикових відходів. 20% елементів верху мінімум на 50% складаються із перероблених матеріалів."
,
            image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-f76cb.appspot.com/o/products%2F%20OZELIA.jpeg?alt=media&token=13ebc194-7678-4aae-873d-4c6aac9cf3ad"
,
            price: 4999,
            isFavorite: false
        )
    )
        .environmentObject(ViewModel())
}


