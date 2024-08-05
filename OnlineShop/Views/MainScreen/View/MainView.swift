//
//  ContentView.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI
import FirebaseFirestore

struct MainView: View {
    // MARK: - Properties
    @FirestoreQuery(collectionPath: "shop") var items: [ProductModel]
    var columns = Array(repeating: GridItem(), count: 2)
    
    
    // MARK: - Body
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        ProductCardView(product: item)
                    }
                }
            }
            .padding(.horizontal, 10)
            .background(.secondary.opacity(0.3))
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 8, x: 5, y: 8)
            
            // MARK: - Navigation Bar
            .navigationTitle("Товари")
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoritesView()) {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        Image(systemName: "cart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        
        
    }
}

#Preview {
    MainView()
}
