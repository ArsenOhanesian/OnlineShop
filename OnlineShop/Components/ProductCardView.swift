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
    
    private let padding: CGFloat = 10
    private let cellHeight: CGFloat = UIScreen.main.bounds.width * 0.5
    
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
                        print("Hehe")
                        vm.toggleFavorite(in: product)
                    } label: {
                        Image(systemName: Helper.Images.heart)
                            .padding(padding)
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
                .padding(padding)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.opacity(0.5))
                .cornerRadius(10)
                .padding(padding)
                
            }
        }
        .frame(height: cellHeight)
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
