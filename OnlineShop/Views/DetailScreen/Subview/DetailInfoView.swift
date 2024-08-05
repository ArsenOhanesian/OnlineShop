//
//  DetailInfoView.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI

struct DetailInfoView: View {
    // MARK: - Proiperties
    let product: ProductModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                Text(product.name)
                    .titleFont()
                Spacer()
                Text("\(product.price)")
                    .titleFont()
            }
            
            Text(product.description)
                .subTitleFont()
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(8)
            
            Spacer()
            
            Button{
                
            } label: {
                Text("Додати в кошик")
                    .frame(maxWidth: .infinity)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 8)
            }
            
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    DetailInfoView()
}
