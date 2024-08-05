//
//  ProductCardView.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI

struct ProductCardView: View {
    // MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    let product: ProductModel
    // MARK: - Body
    var body: some View {
        GeometryReader{ geo in
            let size = geo.size
            
            
            
            ZStack(alignment: .bottom) {
                ZStack(alignment: .topTrailing){
                    if let url = URL(string: product.image){
                        CardImageView(url: url, width: size.width, height: size.height)
                    }
                    
                    Button{
                        vm.toggleFavorite(in: product)
                    } label: {
                        Image(systemName: "heart.fill")
                            .padding(8)
                            .foregroundStyle(product.isFavorite ? .red : .white)
                            .background(.black)
                            .clipShape(Circle())
                            .padding()
                            
                    }
                    
                }
                
                VStack(alignment: .leading){
                    Text(product.name)
                        .titleFont()
                        .lineLimit(1)
                    Text("₴ \(product.price)")
                        .subTitleFont()
                        
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.opacity(0.5))
                .cornerRadius(10)
                .padding(10)
                
            }
        }
        .frame(height: UIScreen.main.bounds.width * 0.5)
//        .background(.background.opacity(0.5))
//        .padding()
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
