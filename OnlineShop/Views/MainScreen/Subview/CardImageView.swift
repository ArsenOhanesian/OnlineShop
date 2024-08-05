//
//  CardImageView.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI

struct CardImageView: View {
    // MARK: - Properties
    let url: URL
    let width: CGFloat
    let height: CGFloat
    
    // MARK: - Body
    var body: some View {
        AsyncImage(url: url) { img in
            img
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        } placeholder: {
            ProgressView()
                .frame(width: width, height: height)
        }
    }
}

#Preview {
    CardImageView(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/onlineshop-f76cb.appspot.com/o/products%2Fozweego.jpeg?alt=media&token=beba0bae-1fdf-4bbe-a91e-065f5fcc25dd")!
, width: 100, height: 100)
}
