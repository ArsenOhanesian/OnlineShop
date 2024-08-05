//
//  FavoritesView.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI
import FirebaseFirestore

struct FavoritesView: View {
    // MARK: - Properties
    @FirestoreQuery(collectionPath: Helper.Firebase.shop,
                    predicates: [.isEqualTo(Helper.Firebase.isFavorite, true)]) private var favoriteProducts: [ProductModel]
    
    private var columns = Array(repeating: GridItem(), count: 2)
    private let hPadding: CGFloat = 10
    
    // MARK: - Body
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: columns) {
                ForEach(favoriteProducts) { item in
                    NavigationLink(destination: DetailView(product: item)) {
                        ProductCardView(product: item)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal, hPadding)
        .background(.secondary.opacity(0.3))
        .navigationTitle(Helper.Titles.favorite)
    }
}

#Preview {
    FavoritesView()
}
